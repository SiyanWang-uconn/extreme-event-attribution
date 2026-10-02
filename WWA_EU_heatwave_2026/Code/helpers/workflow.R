# Reusable, inspectable steps for daily gridded temperature attribution.
# Dataset scripts call these functions one step at a time and keep each returned
# object in the Global Environment for inspection.

open_temperature_dataset <- function(file, variable, kelvin_to_celsius = FALSE) {
  nc <- ncdf4::nc_open(file)
  metadata <- nc$var[[variable]]
  dimension_names <- vapply(metadata$dim, function(x) x$name, character(1))
  stopifnot(identical(dimension_names, c("lon", "lat", "time")))

  lon_original <- nc$dim$lon$vals
  lon <- (lon_original + 180) %% 360 - 180
  lat <- nc$dim$lat$vals
  time_values <- nc$dim$time$vals
  time_units <- nc$dim$time$units
  time_origin <- as.Date(substr(sub("^days since ", "", time_units), 1, 10))
  date <- time_origin + time_values

  sample_array <- ncdf4::ncvar_get(
    nc, variable, start = c(1, 1, 1), count = c(-1, -1, 1),
    collapse_degen = FALSE
  )
  sample_grid <- sample_array[, , 1]
  if (kelvin_to_celsius) sample_grid <- sample_grid - 273.15

  list(
    nc = nc,
    metadata = metadata,
    dimension_names = dimension_names,
    lon_original = lon_original,
    lon = lon,
    lat = lat,
    date = date,
    sample_grid = sample_grid
  )
}

find_persistent_footprint <- function(nc, variable, date, nlon, nlat,
                                      minimum_fraction = 0.95) {
  number_of_days <- length(date)
  number_of_cells <- nlon * nlat
  chunk_starts <- seq(1L, number_of_days, by = 366L)
  valid_day_count <- rep(0, number_of_cells)

  for (chunk_start in chunk_starts) {
    chunk_end <- min(chunk_start + 365L, number_of_days)
    chunk_days <- chunk_start:chunk_end
    values <- ncdf4::ncvar_get(
      nc, variable, start = c(1, 1, chunk_start),
      count = c(-1, -1, length(chunk_days)), collapse_degen = FALSE
    )
    value_matrix <- matrix(values, nrow = number_of_cells)
    valid_day_count <- valid_day_count + rowSums(is.finite(value_matrix))
    message("Footprint: ", date[chunk_start], " to ", date[chunk_end])
  }

  valid_fraction <- valid_day_count / number_of_days
  list(
    included = valid_fraction >= minimum_fraction,
    valid_fraction = valid_fraction
  )
}

map_external_mask <- function(lon, lat, mask_file) {
  mask_table <- read.csv(mask_file)
  stopifnot(all(c("lon", "lat", "included") %in% names(mask_table)))
  mask_lon <- unique(mask_table$lon)
  mask_lat <- unique(mask_table$lat)
  mask_grid <- matrix(
    as.logical(mask_table$included),
    nrow = length(mask_lon), ncol = length(mask_lat)
  )
  nearest_lon <- vapply(lon, function(x) which.min(abs(mask_lon - x)), integer(1))
  nearest_lat <- vapply(lat, function(x) which.min(abs(mask_lat - x)), integer(1))
  as.vector(mask_grid[nearest_lon, nearest_lat, drop = FALSE])
}

calculate_daily_regional_temperature <- function(nc, variable, date, lon, lat,
                                                  footprint,
                                                  kelvin_to_celsius = FALSE) {
  number_of_days <- length(date)
  number_of_cells <- length(lon) * length(lat)
  chunk_starts <- seq(1L, number_of_days, by = 366L)
  latitude_weights <- cos(lat * pi / 180)
  grid_weights <- rep(latitude_weights, each = length(lon))
  grid_weights[!footprint] <- 0
  daily_value <- rep(NA_real_, number_of_days)
  coverage <- rep(NA_real_, number_of_days)

  for (chunk_start in chunk_starts) {
    chunk_end <- min(chunk_start + 365L, number_of_days)
    chunk_days <- chunk_start:chunk_end
    values <- ncdf4::ncvar_get(
      nc, variable, start = c(1, 1, chunk_start),
      count = c(-1, -1, length(chunk_days)), collapse_degen = FALSE
    )
    if (kelvin_to_celsius) values <- values - 273.15
    value_matrix <- matrix(values, nrow = number_of_cells)
    valid <- is.finite(value_matrix)
    denominator <- colSums(valid * grid_weights)
    value_matrix[!valid] <- 0
    daily_value[chunk_days] <- colSums(value_matrix * grid_weights) / denominator
    coverage[chunk_days] <- denominator / sum(grid_weights)
    message("Regional mean: ", date[chunk_start], " to ", date[chunk_end])
  }

  daily_value[coverage < 0.95] <- NA_real_
  data.frame(date = date, value = daily_value, spatial_coverage = coverage)
}

calculate_three_day_extremes <- function(daily_data) {
  daily_data$year <- as.integer(format(daily_data$date, "%Y"))
  daily_data$month <- as.integer(format(daily_data$date, "%m"))
  daily_data$value3 <- as.numeric(
    stats::filter(daily_data$value, rep(1 / 3, 3), sides = 1)
  )

  years <- sort(unique(daily_data$year))
  annual <- data.frame()
  june <- data.frame()

  for (selected_year in years) {
    annual_start <- as.Date(sprintf("%d-01-01", selected_year))
    annual_end <- as.Date(sprintf("%d-12-31", selected_year))
    annual_block <- daily_data[
      daily_data$date >= annual_start & daily_data$date <= annual_end,
    ]
    expected <- as.integer(annual_end - annual_start) + 1L
    complete <- nrow(annual_block) == expected &&
      mean(is.finite(annual_block$value)) >= 0.95
    candidates <- annual_block$value3[annual_block$date >= annual_start + 2]
    extreme <- if (complete) max(candidates, na.rm = TRUE) else NA_real_
    annual <- rbind(annual, data.frame(
      year = selected_year, season = "Annual", complete = complete, X = extreme
    ))

    june_start <- as.Date(sprintf("%d-06-01", selected_year))
    june_end <- as.Date(sprintf("%d-06-30", selected_year))
    june_block <- daily_data[
      daily_data$date >= june_start & daily_data$date <= june_end,
    ]
    complete <- nrow(june_block) == 30L &&
      mean(is.finite(june_block$value)) >= 0.95
    candidates <- june_block$value3[june_block$date >= june_start + 2]
    extreme <- if (complete) max(candidates, na.rm = TRUE) else NA_real_
    june <- rbind(june, data.frame(
      year = selected_year, season = "June", complete = complete, X = extreme
    ))
  }

  list(daily = daily_data, annual = annual, june = june,
       combined = rbind(annual, june))
}

prepare_smoothed_gmst <- function(gmst_file) {
  raw <- read.csv(gmst_file, skip = 1, check.names = FALSE,
                  na.strings = c("***", "****", "*****"))
  months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
              "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  monthly <- as.matrix(raw[, months])
  storage.mode(monthly) <- "double"
  annual_value <- rowMeans(monthly)
  annual_value[rowSums(is.finite(monthly)) != 12] <- NA_real_
  observed <- data.frame(year = as.integer(raw$Year), annual = annual_value)
  observed <- observed[is.finite(observed$annual), ]
  endpoint_trend <- lm(annual ~ year, data = tail(observed, 15))
  complete <- merge(
    data.frame(year = seq(min(observed$year), 2027L)), observed,
    by = "year", all.x = TRUE
  )
  complete$extrapolated <- !is.finite(complete$annual)
  complete$annual[complete$extrapolated] <- predict(
    endpoint_trend, newdata = complete[complete$extrapolated, ]
  )
  complete$gmst <- NA_real_
  for (row_number in seq_len(nrow(complete))) {
    y <- complete$year[row_number]
    values <- complete$annual[match((y - 2):(y + 1), complete$year)]
    if (!anyNA(values)) complete$gmst[row_number] <- mean(values)
  }
  list(raw = raw, observed = observed, endpoint_trend = endpoint_trend,
       complete = complete,
       gmst_2026 = complete$gmst[complete$year == 2026])
}

join_extremes_and_gmst <- function(extremes, gmst_complete) {
  joined <- merge(extremes, gmst_complete[, c("year", "gmst")],
                  by = "year", all.x = TRUE)
  joined$used_in_fit <- joined$complete & joined$year <= 2025 &
    is.finite(joined$gmst)
  list(
    all = joined,
    annual = joined[joined$season == "Annual" & joined$used_in_fit, ],
    june = joined[joined$season == "June" & joined$used_in_fit, ]
  )
}

bootstrap_attribution <- function(fit, data, gmst_factual, return_period, B,
                                  seed = 20260915) {
  set.seed(seed)
  simulations <- matrix(NA_real_, nrow = 6, ncol = B)
  rownames(simulations) <- c(
    "RR_2003", "RR_1976",
    "FAR_2003", "FAR_1976",
    "intensity_2003", "intensity_1976"
  )
  location <- fit$mu + fit$alpha * (data$gmst - fit$g0)
  for (b in seq_len(B)) {
    simulated <- qgev_local(runif(nrow(data)), location, fit$sigma, fit$xi)
    new_fit <- tryCatch(fit_gev(simulated, data$gmst), error = function(e) NULL)
    if (!is.null(new_fit)) {
      result <- attribution(new_fit, gmst_factual, return_period)
      simulations[, b] <- c(result$RR, result$FAR, result$intensity_change)
    }
    if (b %% 20 == 0) message("Bootstrap ", b, " of ", B)
  }
  simulations
}

add_bootstrap_intervals <- function(point_results, annual_bootstrap,
                                    june_bootstrap, level = 0.95) {
  alpha <- (1 - level) / 2
  limits <- c(alpha, 1 - alpha)
  result <- point_results
  result$RR_low <- result$RR_high <- NA_real_
  result$FAR_low <- result$FAR_high <- NA_real_
  result$intensity_change_low <- result$intensity_change_high <- NA_real_
  result$bootstrap_success <- NA_integer_

  for (i in seq_len(nrow(result))) {
    boot <- if (result$season[i] == "Annual") annual_bootstrap else june_bootstrap
    suffix <- if (result$reference[i] == "2003-like") "2003" else "1976"
    complete <- colSums(is.na(boot)) == 0
    result$bootstrap_success[i] <- sum(complete)
    for (statistic in c("RR", "FAR", "intensity")) {
      values <- boot[paste0(statistic, "_", suffix), complete]
      interval <- quantile(values, limits, na.rm = TRUE, names = FALSE)
      column_stem <- if (statistic == "intensity") "intensity_change" else statistic
      result[i, paste0(column_stem, "_low")] <- interval[1]
      result[i, paste0(column_stem, "_high")] <- interval[2]
    }
  }
  result
}

write_bootstrap_samples <- function(annual_bootstrap, june_bootstrap, file) {
  to_data_frame <- function(x, season) {
    data.frame(
      iteration = seq_len(ncol(x)),
      season = season,
      as.data.frame(t(x)),
      check.names = FALSE
    )
  }
  samples <- rbind(
    to_data_frame(annual_bootstrap, "Annual"),
    to_data_frame(june_bootstrap, "June")
  )
  write.csv(samples, file, row.names = FALSE)
  invisible(samples)
}

# Parametric bootstrap used for Figure 7 return-level confidence bands.
bootstrap_return_level_curves <- function(fit, data, gmst_factual, gmst_past,
                                          probabilities, B,
                                          seed = 20260922) {
  set.seed(seed)
  current_curves <- matrix(NA_real_, B, length(probabilities))
  past_curves <- matrix(NA_real_, B, length(probabilities))
  success <- logical(B)
  fitted_location <- fit$mu + fit$alpha * (data$gmst - fit$g0)

  for (b in seq_len(B)) {
    simulated <- qgev_local(
      runif(nrow(data)), fitted_location, fit$sigma, fit$xi
    )
    new_fit <- tryCatch(fit_gev(simulated, data$gmst), error = function(e) NULL)
    if (!is.null(new_fit)) {
      current_location <- new_fit$mu +
        new_fit$alpha * (gmst_factual - new_fit$g0)
      past_location <- new_fit$mu +
        new_fit$alpha * (gmst_past - new_fit$g0)
      current_curves[b, ] <- qgev_local(
        probabilities, current_location, new_fit$sigma, new_fit$xi
      )
      past_curves[b, ] <- qgev_local(
        probabilities, past_location, new_fit$sigma, new_fit$xi
      )
      success[b] <- TRUE
    }
    if (b %% 20 == 0) message("Figure 7 bootstrap ", b, " of ", B)
  }

  confidence_band <- function(curves) {
    apply(curves[success, , drop = FALSE], 2, quantile,
          probs = c(0.025, 0.975), na.rm = TRUE, names = FALSE, type = 1)
  }

  list(
    current_curves = current_curves,
    past_curves = past_curves,
    current_ci = confidence_band(current_curves),
    past_ci = confidence_band(past_curves),
    success = success
  )
}
