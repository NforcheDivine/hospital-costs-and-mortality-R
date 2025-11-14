Hospital Costs & Mortality Analysis (SUPPORT Dataset)

Comprehensive statistical analysis of hospital total costs and in-hospital mortality using the SUPPORT dataset.
Includes data cleaning, exploratory analysis, regression modeling, logistic modeling, visualizations, and a reproducible R Markdown report.
📁 Project Structure
hospital-costs-and-mortality-R/
│
├── 01_data/
│   └── README_DATA.txt               # dataset not included for licensing
│
├── 02_scripts/
│   ├── 01_load_and_clean.R           # import + preprocessing
│   ├── 02_analysis.R                 # descriptive statistics
│   ├── 03_visualizations.R           # plots and EDA graphs
│   ├── 04_regression_models.R        # linear regression models (totcst)
│   └── 05_logistic_models.R          # mortality logistic regression
│
├── 03_results/
│   ├── clean_data.csv
│   ├── model1_results.csv
│   ├── model2_results.csv
│   ├── model3_results.csv
│   ├── logit1_results.csv
│   ├── logit2_results.csv
│   ├── logit_confusion_matrix.csv
│   ├── logit_odds_ratios.csv
│   ├── logit_performance.csv
│   └── logit_auc.csv
│
├── 04_figures/
│   ├── model3_residuals.png
│   ├── age_vs_cost.png
│   ├── logit_ROC.png
│   └── correlation_matrix.png
│
├── 05_reports/
│   └── final_report.Rmd              # full reproducible analysis
│
├── README.md
└── .gitignore


🔍 Objective

This project investigates:

Factors influencing total hospital cost (continuous)

Predictors of in-hospital mortality (binary)

Which patient, disease, or severity features have the strongest impact

How well regression and logistic models perform

🧹 1. Data Cleaning

Performed in:

02_scripts/01_load_and_clean.R


Tasks include:

Loading Stata (.dta) SUPPORT dataset

Selecting relevant predictors

Handling missing values

Saving a clean CSV version

📈 2. Exploratory Data Analysis

Performed in:

02_scripts/02_analysis.R
02_scripts/03_visualizations.R


Includes:

Summary statistics

Correlation matrix

Distribution plots

Cost patterns across demographics and disease classes

Outputs saved in:

03_results/
04_figures/

📉 3. Regression Modeling (Continuous Cost)

Script:

02_scripts/04_regression_models.R


Models include:

Linear regression with clinical predictors

Model comparison (AIC, adj. R²)

Residual diagnostics

Interpretation of significant predictors

⚕️ 4. Logistic Regression (Mortality)

Script:

02_scripts/05_logistic_models.R


Outputs include:

Odds ratios

Confusion matrix

ROC curve + AUC

Model accuracy and sensitivity

📊 5. Final Report

Reproducible R Markdown document:

05_reports/final_report.Rmd


Contains:

Introduction

Methods

Statistical models

Visualizations

Interpretation of results

Conclusions

🖥️ How to Run the Project
1️⃣ Clone the repo
git clone https://github.com/YOUR_USERNAME/hospital-costs-and-mortality-R.git
cd hospital-costs-and-mortality-R

2️⃣ Open RStudio

From the menu:

File → Open Project → hospital-costs-and-mortality-R.Rproj

3️⃣ Install required R packages
install.packages(c("tidyverse", "haven", "GGally", "pROC", "broom"))

4️⃣ Run scripts in order
source("02_scripts/01_load_and_clean.R")
source("02_scripts/02_analysis.R")
source("02_scripts/03_visualizations.R")
source("02_scripts/04_regression_models.R")
source("02_scripts/05_logistic_models.R")

5️⃣ Knit the full report

Open:

05_reports/final_report.Rmd


Click Knit → HTML/PDF

👤 Author

Nforche Divine Ako
MSc Statistical Data Analysis – Ghent University

🔗 LinkedIn: https://linkedin.com/in/nforchedivine

📧 nforchedivine@gmail.com