📊 Hospital Costs & Mortality Analysis (SUPPORT Dataset)

A complete statistical analysis project using R, focusing on predicting hospital costs (continuous outcome) and in-hospital mortality (binary outcome) using the SUPPORT dataset.

This project demonstrates:

Data cleaning and preprocessing

Exploratory data analysis

Statistical modeling

Multiple linear regression

Interaction terms

Logistic regression

Odds ratios + confidence intervals

Model diagnostics

ROC curve + AUC

Reproducible R project structure

📁 Project Structure
hospital-costs-and-mortality-R/
│
├── data/
│   └── README_DATA.txt       # dataset not included
│
├── scripts/
│   ├── 01_load_and_clean.R
│   ├── 02_analysis.R
│   ├── 03_visualizations.R
│   ├── 04_regression_models.R
│   └── 05_logistic_models.R
│
├── results/
│   ├── clean_data.csv
│   ├── tables/
│   │   ├── model1_results.csv
│   │   ├── model2_results.csv
│   │   ├── model3_results.csv
│   │   ├── model4_results.csv
│   │   ├── logit1_results.csv
│   │   ├── logit2_results.csv
│   │   ├── logit_odds_ratios.csv
│   │   ├── logit_confusion_matrix.csv
│   │   ├── logit_performance.csv
│   │   └── logit_auc.csv
│   └── figures/
│       ├── model3_residuals.png
│       └── logit_ROC.png
│
├── reports/
│   └── final_report.Rmd       # optional
│
├── README.md
└── .gitignore

🧼 Data Cleaning

Performed in:

scripts/01_load_and_clean.R


Steps include:

Loading Stata file (support.dta)

Selecting relevant variables:

age, sex, dzclass, num_co, edu

slos (length of stay)

totcst (total cost)

hospdead (in-hospital death)

Removing missing values for essential variables

Saving cleaned dataset to:

results/clean_data.csv

📈 Exploratory Data Analysis (EDA)

Performed in:

scripts/02_analysis.R


Includes:

Summary statistics

Distribution of hospital costs

Mortality rate

Correlation structure

Relationship plots between age, comorbidities, slos, and outcomes

Results saved to:

results/tables/summary_overall.csv

🎨 Visualizations

Generated in:

scripts/03_visualizations.R


Examples:

Cost distribution by mortality

Boxplots of costs by disease class

Scatterplots

Density plots

📉 Linear Regression Models (Cost Prediction)

Performed in:

scripts/04_regression_models.R


Models included:

Model 1 — Simple Regression
totcst ~ age

Model 2 — Multiple Regression
totcst ~ age + sex + edu + num_co

Model 3 — Interaction Model
totcst ~ age * num_co + sex + edu

Model 4 — Adding Length of Stay
totcst ~ age * num_co + sex + edu + slos

Diagnostics

Residuals vs fitted

Normality of residuals

Scale-location

Leverage & Cook’s distance

Saved to:

results/figures/model3_residuals.png

🔴 Logistic Regression Models (Mortality Prediction)

Performed in:

scripts/05_logistic_models.R


Models:

Model 1 — Simple logistic model
hospdead ~ age

Model 2 — Multiple logistic model
hospdead ~ age + sex + dzclass + num_co + edu

Outputs:

Coefficients

Odds ratios + 95% confidence intervals

Confusion matrix

Accuracy, sensitivity, specificity

ROC curve

AUC score

Saved to:

results/tables/logit_odds_ratios.csv
results/tables/logit_confusion_matrix.csv
results/tables/logit_performance.csv
results/tables/logit_auc.csv
results/figures/logit_ROC.png

🧪 How to Reproduce the Analysis
1️⃣ Clone the repo
git clone https://github.com/NforcheDivine/hospital-costs-and-mortality-R.git
cd hospital-costs-and-mortality-R

2️⃣ Add the dataset (not included)

Place the SUPPORT dataset (support.dta) inside:

data/

3️⃣ Run scripts in order:
source("scripts/01_load_and_clean.R")
source("scripts/02_analysis.R")
source("scripts/03_visualizations.R")
source("scripts/04_regression_models.R")
source("scripts/05_logistic_models.R")


All results will appear inside the results/ folder.

🧑‍💻 Author

Nforche Divine Ako
📍 MSc Statistical Data Analysis – Ghent University
💼 LinkedIn: https://www.linkedin.com/in/nforche-divine-ako-7a821889/

📧 Email: nforchedivine@gmail.com