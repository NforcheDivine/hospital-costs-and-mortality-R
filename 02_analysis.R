# 02_analysis.R
# Basic analysis on cleaned SUPPORT data

library(tidyverse)

# load cleaned data created by 01_load_and_clean.R
data <- read_csv("results/clean_data.csv", show_col_types = FALSE)

# simple summary statistics
summary_tbl <- data %>%
  summarise(
    n          = n(),
    mean_age   = mean(age, na.rm = TRUE),
    sd_age     = sd(age, na.rm = TRUE),
    mean_cost  = mean(totcst, na.rm = TRUE),
    median_cost= median(totcst, na.rm = TRUE),
    death_rate = mean(hospdead, na.rm = TRUE)
  )

dir.create("results/tables", showWarnings = FALSE)
write_csv(summary_tbl, "results/tables/summary_overall.csv")

print(summary_tbl)
message("✔ Analysis summary saved to results/tables/summary_overall.csv")
