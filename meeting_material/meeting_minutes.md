
# 2026/09/03

**Date: 2026/09/03**  
**Time: 9AM**  


## 1. What We Discussed

### Progress Updates

- Update repo bib
- Read Naveau2020.
- Check Min 2011's work wether attribution or not.
- Understand how to calculate PR(RR) FAR


### Research Results / Materials Presented

- 

### Main Discussion Points

- 

### Questions and Concerns

  - Is the "optimal fingerprinting" usually used in long-term trend attribution? For example: the one signal model for ANT is said to be $\mathbf{y}_{\mathrm{obs}} = \beta_{ANT} \mathbf{x_{ANT}} + \varepsilon$ 
  So that is different with problistic attribution?

  - 


## 2. What We Decided

### Decisions

- 

### Advisor’s Feedback and Recommendations

- 

### Changes to the Research Plan or Methods

- 

## 3. What to Do Next

| Action Item | Responsible Person | Deadline | Status |
|---|---|---|---|
|  |  |  | Not started |
|  |  |  | Not started |
|  |  |  | Not started |

## Next Meeting

**Date:**  

**Topics for the next meeting:**

- 
- 



# 2026/08/21

**Date: 2026/08/21**  
**Time: 4 pm**  
**Attendees: Siyan Wang & Dr. Jun Yan**  
**Meeting Topic:**  

## 1. What We Discussed

### Progress Updates

- Read paper *Statistical method for extreme event Attribution in climate Science* Section 5 *Statistical Method*

### Research Results / Materials Presented

- Review paper: *Detection and attribution of climate extremes in the observed record*

### Main Discussion Points

- See decision.

### Questions and Concerns

- In Easterling et al. paper, check if Min 2011 really used Extreme data/distribution.
- Do we have newer review (later than 2020) in EEA ?

## 2. What We Decided

### Decisions

- Read Naveau et al. paper carefully and closely.
- Find a dataset and apply all the concept (PR,FAR) to understand them better, ie, connect to real world issue.
- Think about how to apply casual inference in EEA (find relative papers).
- Find several paper related to the newest Extreme problem (Texas snowstorm, heatwave, ie temperature ) and learn from it.

### Advisor’s Feedback and Recommendations

- Keep only one file for meeting minutes.
- For repository:
  1. Cite all paper I have read (or will read) in a bib file and have each link (bibkey) to the the specific paper (on repo?).
  2. Named all reference by small name.
  3. Never use git add .
  4. Pronounce every word correctly without hesitation.


### Changes to the Research Plan or Methods

- Weekly meeting time change to every Thursday Morning 9AM.

## 3. What to Do Next

| Action Item | Responsible Person | Deadline | Status |
|---|---|---|---|
| Organize tex environment | Me | ASAP |  |
| Read Naveau et al. paper | Me | Before next meeting  | ing |
| Read every word appropriate | Me  | Before next meeting  | ing |


## Next Meeting

**Date: 2026/09/03 (Recur every week)**  

**Topics for the next meeting:**

- 

# 2026/08/14

**Date: 2026/08/14**  
**Time: 4 pm**  
**Attendees: Siyan & Dr.Jun Yan**  
**Meeting Topic: Extreme events attribution meeting No.3**  

## 1. What We Discussed

### Progress Updates

- Gathered  15 papers on this field, including review, methodology and application papers.
- Created a github repository
- Uploaded all papers on to the repo, named them by year_author_topic_category

### Research Results / Materials Presented

- Review paper: *Detection and attribution of climate extremes in the observed record*

### Main Discussion Points

- Understanding FAR(Fraction Attribution Risk)

- 3 kinds of model structure:

   1. Both the response and explanatory information are derived from observations.

   2. The observed response $Y_{\text{obs}}$ is compared with fingerprints estimated from climate model simulations ($X_{\text{simulated}}$).

   3. Simulations are used to construct a counterfactual climate and estimate changes in the probability of an extreme event.

- Discussed several data-quality issues:
  - Long-term station records may be affected by station changes, urbanization, and other sources of inhomogeneity.
  - The homogeneity of observational records must be evaluated before trend analysis.
  - Spatial coverage of observations is often incomplete.
  - Monte Carlo techniques can be used to account for incomplete spatial coverage, although they may not always be necessary.
  - Estimates of extremes from different reanalysis products can differ substantially at the same location.

- Discussed spatial aggregation:
  - Aggregating data over larger regions can produce more statistically significant results.
  - However, increased statistical significance does not necessarily mean that the result is scientifically meaningful.

- Discussed the datasets and climate indices used in detection studies:
  - **HadEX2** is a gridded observational dataset of climate-extreme indices.
  - **GHCNDEX** is also an observational dataset rather than a simulated dataset.
  - Climate model simulations are obtained from sources such as **CMIP**.

- Discussed statistical methods for detecting changes in climate extremes:
  - A nonparametric approach based on Kendall’s tau can be used to estimate trends.
  - The generalized extreme value (**GEV**) distribution is used to model the tails of atmospheric variables.
  - Uncertainty must be considered when estimating trends and extreme-value distributions.

- Discussed temperature-extreme indices, including:
  - **TXx:** Annual maximum of daily maximum temperature
  - **TNn:** Annual minimum of daily minimum temperature

### Questions and Concerns

- Can an attribution analysis be conducted entirely using observational data?
- How is the counterfactual climate constructed when it cannot be directly observed?
- How can causal inference methods contribute to extreme climate event attribution?
- What are the main statistical limitations of current attribution methods?

## 2. What We Decided

### Decisions

- Use presentation tool for presenting paper, ie, slides.

- Read the review paper on *Annual Review of Stats and App* at 2017 *Statistical method for extreme event Attribution in climate Science* and all of its reference.

- Make a better repository, referring the framework in Dr. Jun's Book.

- Write a small review paper in this topic



## 3. What to Do Next

Referring Section 2 Decisions

## Next Meeting

**Date: 2026/8/21**  

**Topics for the next meeting:**

- Finish the presentation of the current paper
- Present Statistical method review paper.
