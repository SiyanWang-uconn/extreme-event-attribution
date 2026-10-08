# Meeting Minutes

**Date: 10/8/2026**  
**Time: 9AM**  


## 1. What We Discussed

### Progress Updates

- Tutorial paper draft
- Add up goodness-of-fit check

### Research Results / Materials Presented

- 

### Main Discussion Points

- Adjustment of paper
- Next step priority is getting the data about Pakistan flood.
- 

### Questions and Concerns

- What other way we can use to dealing non-stationary data?
- How to deal with return level under non-stationary data?
- If the KS test appropriate in this non-stationary example?
- Is Ljung-box test appropriate here?
- Probably we can include the introduction of PN, PNS,PS such causal concept in this paper.(Siyan thoughts)


## 2. What We Decided

### Decisions

- **First priority**: Get data from WCRP about Pakistan flood.
- Paper:
  1. Do not include fig7 in our paper, as this is what they have done.
  2. Adjust the frame: intro->set up(data glance, raise up problem et al.)->method(notation,theory)->results
  3. Intro should answer 3 question: Why important? What has been done? What's new (create a step-by-step turoial paper,
  make the cutting edge method accessible)?
- Repo:
  1. Use makefile tool.
  2. Adjust bib file(At least have a glance about the literature).


### Advisor’s Feedback and Recommendations

- Above
- Think about what could be counterfactual? The combination of causal inference and extreme value theory is less 
crowded, we should catch that.



### Changes to the Research Plan or Methods

- **First priority**: Get data from WCRP about Pakistan flood. Try to applied the same method in this data.

## 3. What to Do Next

| Action Item | Responsible Person | Deadline | Status |
|---|---|---|---|
| Get data  | Siyan  | ASAP | Not started |
| Update bib| Siyan |  | Not started |
| Update paper | Siyan |  | Not started |


# 2026/09/24


**Date: 09/24/2026**  
**Time: 9AM**  


## 1. What We Discussed

### Progress Updates

- Reproduce WWA EU 2026 heatwave report

### Research Results / Materials Presented

- 

### Main Discussion Points

- What is the fig 7 ploting.
- What is the raw data looks like.
- Is the GMST by year?

### Questions and Concerns

- 

## 2. What We Decided

### Decisions

- Write a tutorial paper on 2026 EU heatwave. Apply Naveau's methods

### Advisor’s Feedback and Recommendations

- Put slides to meeting material folder.
- Understand fingerprinting: 1. ma2023optimal for process and concept 2. lau2023extreme for the combination of it and EVT. 3. li2026adaptable for methodology on fingerprinting
- Read fingerprinting paper and ready to present.
- Understand code and reproduce, including the plot

### Changes to the Research Plan or Methods

- Target a tutorial paper.

## 3. What to Do Next

| Action Item | Responsible Person | Deadline | Status |
|---|---|---|---|
| Reproduce code  | Siyan  | This week | Not started |
| Read paper | Siyan |  | Not started |
| Write manuscript | Siyan |  | Not started |



# 2026/09/10

**Date: 2026/09/10**  
**Time: 9AM**  

## 1. What We Discussed

### Progress Updates

- Understood fingerprint-based detection and attribution methods.
- Read and summarized Naveau et al. (2020) on extreme event attribution.
- Found the topic (2026 European heat wave) for case study and its relative reports.
- Prepared slides for the research meeting.

### Research Results / Materials Presented

- 0910slides

### Main Discussion Points

- 

### Questions and Concerns

- Did the 2026 WWA report use non-parameter counting on counterfactual world?

## 2. What We Decided

### Decisions

- Keep going on the reproduction of WWA 2026 EU heatwave report (**Primary**).
- Read Yan's 2023 fingerprinting paper, understand fingerprinting. When applicable, 
read JASA paper on combination of fingerprinting & EVT
- Read Hannart et. al work at 2016 about counterfactual causality (Digest definition of PN/PNS/PS).


### Advisor’s Feedback and Recommendations

- Be familiar with the Journal rank, so choose the influence paper.
- Remember people's name when referring their work.
- Be careful of notation, be consistent.
- Understand the calculation of nan-parameter event counting in counterfactual world.


### Changes to the Research Plan or Methods

- Probably we can step into the bivariate  Extreme Value Theory in the future.



## 3. What to Do Next

| Action Item | Responsible Person | Deadline | Status |
|---|---|---|---|
| Reproduce WWA 2026 EU heatwave report  | Siyan | This week | -ing |
|  Read Yan's 2023 fingerprinting paper | Siyan |  | Not started |
|  Read Hannart et. al 2016| Siyan |  | Not started |




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

- No pdf in git repo, onlt the source file.
- Use bibtex tool sort reference.bib
- Understand fingerprinting methods(concept) not only in extreme topics.
- Find data and get hands on EEA, probabily make it a course project/case study *(Aim for this semester)*.
- Try to reproduce pepople's work.
- Next week: Present Naveau's paper.


### Advisor’s Feedback and Recommendations

- For question: Yes, and that is not our aim
- 

### Changes to the Research Plan or Methods

- Write a review paper at the end of semester.

## 3. What to Do Next

| Action Item | Responsible Person | Deadline | Status |
|---|---|---|---|
| Figure out tex environment  | Siyan | ASAP | Done |
| Review paper | Siyan | This wwek | -ing |
| Understand fingerprinting | Siyan | This week | Done |

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
