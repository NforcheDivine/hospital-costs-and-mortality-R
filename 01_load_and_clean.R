# 01_load_and_clean.R
# Load and clean SUPPORT data

library(tidyverse)
library(haven)

# load data (Stata file)
data <- read_dta("data/support.dta")

# keep only variables we care about (now including slos)
data <- data %>%
  select(
    age,
    sex,
    dzclass,
    num_co,
    edu,
    slos,       # length of stay
    totcst,
    hospdead
  )

# drop rows with missing total cost
data <- data %>% filter(!is.na(totcst))

# save cleaned version
dir.create("results", showWarnings = FALSE)
write_csv(data, "results/clean_data.csv")

message("✔ Data loaded and cleaned. Saved to results/clean_data.csv")
