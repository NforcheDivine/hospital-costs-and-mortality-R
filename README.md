# 🏥 Hospital Costs & In-Hospital Mortality — R Project

This project analyzes hospital costs and in-hospital mortality using the SUPPORT dataset.

- Outcome 1 (continuous): total hospital cost (`totcst`)
- Outcome 2 (binary): in-hospital death (`hospdead`)
- Predictors include: age, sex, disease class (`dzclass`), number of comorbidities (`num_co`), and years of education (`edu`).

## 🔧 Files

- `scripts/01_load_and_clean.R` — loads `support.dta`, selects key variables, saves `results/clean_data.csv`
- `scripts/02_analysis.R` — computes basic summary statistics and saves them to `results/tables/`
- `scripts/03_visualizations.R` — creates basic plots and saves them to `results/figures/`
- `requirements.R` — installs the required R packages

## ▶️ How to Run

In R:

```r
# set working directory to the project folder
setwd("C:/Users/HOME/PycharmProjects/hospital-costs-and-mortality-R")

source("requirements.R")               # install packages (first time)
source("scripts/01_load_and_clean.R")  # create cleaned data
source("scripts/02_analysis.R")        # create summary table
source("scripts/03_visualizations.R")  # create figures
