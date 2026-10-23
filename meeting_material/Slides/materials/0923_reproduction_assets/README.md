# Slide sources

The slides summarize existing preliminary fits; no model was refitted for this deck.

Source directory:
/Users/wangcaiyan/Documents/Codex/2026-09-15/https-spiral-imperial-ac-uk-server/outputs/cpc_rr

results.csv combines the five saved results_*/*risk_ratios_PROVISIONAL.csv files, with a dataset column added. The three *_extremes.csv files are unchanged source copies. figure7.pdf is an unchanged copy of figure7/figure7_tx3x_three_datasets.pdf; LaTeX displays its three completed panels. Original figure bands use 300 bootstrap replicates; result CSV intervals use 200 requested replicates.

series.pdf and intensity.pdf only visualize the saved values. To regenerate: Rscript 0923_reproduction_assets/make_charts.R (base R only).

Compile from the extreme-event-attribution root, twice:
pdflatex -output-directory=build 0923_reproduction_slides.tex

Limitations are stated in the deck: ERA5 and synthesis pending; provisional GMST endpoint extrapolation; source versions and preprocessing not fully aligned.


## Report comparison revision
Original report: /Users/wangcaiyan/Documents/Codex/2026-09-15/https-spiral-imperial-ac-uk-server/work/report.pdf
report_page12.pdf is an unchanged extracted original page; LaTeX crops Figure 7 panels and Table 2. report_page11.pdf is a reference page not displayed.
intensity_comparison.pdf juxtaposes report Table 2 synthesis and existing individual-dataset estimates; these are different levels of aggregation. Regenerate with Rscript 0923_reproduction_assets/compare_intensity.R. Report 2003 intensity values and intervals are also in report_table2_intensity_2003.csv.
The centering means on slide 2 were calculated directly from gmst for rows marked used_in_fit in the saved annual_extremes_and_gmst.csv files. Endpoints come from results_cpc_tmax/gmst_annual_and_endpoint_assumptions.csv.
Data-type references: report Appendix A1.1; https://psl.noaa.gov/data/gridded/data.cpc.globaltemp.html ; https://berkeleyearth.org/data/ .

## ERA5 Tx3x addition

The ERA5 Tx3x fit uses the saved `results_era5_tx` outputs from the reproduction task. The fit covers 1950--2025 (76 years) for both Annual and June Tx3x. `ERA5_extremes.csv` and `era5_tx_risk_ratios_PROVISIONAL.csv` are unchanged copies of the corresponding saved outputs.

`figure7.pdf`, `figure7.png`, and `figure7_plot_summary.csv` now contain all four Annual Tx3x panels, including ERA5. The ERA5 panel uses 300 successful parameter-bootstrap fits. `results.csv` includes the four ERA5 point-estimate and interval rows so `compare_intensity.R` can include ERA5 in `intensity_comparison.pdf`.

ERA5 Tn3x and the multi-dataset synthesis remain pending. The deck PDF was not compiled after this update, following the user's standing preference.
