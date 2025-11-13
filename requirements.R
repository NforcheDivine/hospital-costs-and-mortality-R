pkgs <- c(
  "tidyverse",
  "ggplot2",
  "dplyr",
  "readr",
  "broom",
  "caret",
  "pROC",
  "corrplot",
  "patchwork",
  "janitor",
  "MASS",
  "haven",
  "GGally"
)

install.packages(setdiff(pkgs, rownames(installed.packages())))

