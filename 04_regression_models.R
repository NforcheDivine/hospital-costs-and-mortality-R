# 04_regression_models.R
# Linear regression models for total cost (continuous outcome)

library(tidyverse)
library(broom)
library(car)

# Load cleaned data
data <- read_csv("results/clean_data.csv", show_col_types = FALSE)

# -----------------------------
# MODEL 1 – Baseline model
# Outcome: totcst
# Predictor: age (main predictor)
# -----------------------------

model1 <- lm(totcst ~ age, data = data)
summary(model1)

# Save Model 1 results
model1_results <- tidy(model1)
write_csv(model1_results, "results/tables/model1_results.csv")


# -----------------------------
# MODEL 2 – Add predictors
# Predictors added: sex, edu, num_co
# -----------------------------

model2 <- lm(totcst ~ age + sex + edu + num_co, data = data)
summary(model2)

write_csv(tidy(model2), "results/tables/model2_results.csv")


# -----------------------------
# MODEL 3 – Interaction model
# Interaction: age × num_co
# -----------------------------

model3 <- lm(totcst ~ age * num_co + sex + edu, data = data)
summary(model3)

write_csv(tidy(model3), "results/tables/model3_results.csv")


# -----------------------------
# DIAGNOSTICS – residual plots
# -----------------------------

png("results/figures/model3_residuals.png", width = 1000, height = 800)
par(mfrow = c(2, 2))
plot(model3)
dev.off()


# -----------------------------
# PREDICTION INTERVAL
# Predict cost for a 70-year-old patient with:
# sex = 1 (male), edu = 12 years, num_co = 2
# -----------------------------

new_obs <- data.frame(age = 70, sex = 1, edu = 12, num_co = 2)

pred_int <- predict(model3, newdata = new_obs, interval = "prediction")
pred_int

write_csv(as.data.frame(pred_int), "results/tables/prediction_interval.csv")


# -----------------------------
# MODEL 4 – Adding length of stay (slos)
# -----------------------------

model4 <- lm(totcst ~ age * num_co + sex + edu + slos, data = data)
summary(model4)

write_csv(tidy(model4), "results/tables/model4_results.csv")
