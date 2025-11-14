# 05_logistic_models.R
# Logistic regression models for hospital death (hospdead)

library(tidyverse)
library(broom)
library(pROC)

# -------------------------------------------
# Load cleaned data
# -------------------------------------------
data <- read_csv("results/clean_data.csv", show_col_types = FALSE)

# Use only rows with complete info for logistic model
analysis_data <- data %>%
  drop_na(age, sex, dzclass, num_co, edu, hospdead)

# -------------------------------------------
# MODEL 1: Base logistic model
# Outcome: hospdead
# Predictor: age (main predictor)
# -------------------------------------------

logit1 <- glm(hospdead ~ age, data = analysis_data, family = binomial)
summary(logit1)

write_csv(tidy(logit1), "results/tables/logit1_results.csv")

# -------------------------------------------
# MODEL 2: Add predictors
# Predictors: age + sex + dzclass + num_co + edu
# -------------------------------------------

logit2 <- glm(hospdead ~ age + sex + dzclass + num_co + edu,
              data = analysis_data, family = binomial)
summary(logit2)

write_csv(tidy(logit2), "results/tables/logit2_results.csv")

# -------------------------------------------
# Odds ratios + 95% CI for Model 2
# -------------------------------------------

or_table <- tidy(logit2, exponentiate = TRUE, conf.int = TRUE)
write_csv(or_table, "results/tables/logit_odds_ratios.csv")

# -------------------------------------------
# MODEL PERFORMANCE: confusion matrix
# -------------------------------------------

# predicted probabilities from Model 2
prob <- predict(logit2, type = "response")

# classify using 0.5 threshold
pred_class <- ifelse(prob > 0.5, 1, 0)

# confusion matrix
conf_mat <- table(Predicted = pred_class, Actual = analysis_data$hospdead)
conf_mat

write_csv(as.data.frame(conf_mat), "results/tables/logit_confusion_matrix.csv")

# accuracy, sensitivity, specificity
accuracy    <- mean(pred_class == analysis_data$hospdead)
sensitivity <- sum(pred_class == 1 & analysis_data$hospdead == 1) / sum(analysis_data$hospdead == 1)
specificity <- sum(pred_class == 0 & analysis_data$hospdead == 0) / sum(analysis_data$hospdead == 0)

perf <- tibble(
  accuracy    = accuracy,
  sensitivity = sensitivity,
  specificity = specificity
)

write_csv(perf, "results/tables/logit_performance.csv")

# -------------------------------------------
# ROC curve + AUC
# -------------------------------------------

roc_obj <- roc(analysis_data$hospdead, prob)

dir.create("results/figures", showWarnings = FALSE)

png("results/figures/logit_ROC.png", width = 900, height = 700)
plot(roc_obj, col = "blue", main = "ROC Curve for Logistic Regression")
dev.off()

auc_value <- auc(roc_obj)
write_csv(tibble(AUC = as.numeric(auc_value)), "results/tables/logit_auc.csv")

message("✔ Logistic models complete. Tables in results/tables and ROC curve in results/figures.")
