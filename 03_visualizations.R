# 03_visualizations.R
# Basic visualizations for SUPPORT data

library(tidyverse)
library(GGally)

# load cleaned data
data <- read_csv("results/clean_data.csv", show_col_types = FALSE)

dir.create("results/figures", showWarnings = FALSE)

# 1) Distribution of total cost
p_cost <- ggplot(data, aes(totcst)) +
  geom_histogram(bins = 40, fill = "steelblue", alpha = 0.7) +
  labs(
    title = "Distribution of Total Hospital Cost",
    x = "Total Cost",
    y = "Count"
  )

ggsave("results/figures/cost_distribution.png", p_cost,
       width = 7, height = 4.5, dpi = 150)

# 2) Simple pair plot for numeric variables
num_data <- data %>% select(age, edu, num_co, totcst)

png("results/figures/pairs_numeric.png", width = 1000, height = 1000)
print(ggpairs(num_data))
dev.off()

message("✔ Figures saved to results/figures/")
