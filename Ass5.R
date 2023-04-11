# Load necessary packages
library(tidyverse)
library(gridExtra)

# Import the data
data <- read_csv("WOT.csv")
print(data)
# Filter the data to remove tanks with three or fewer battles played
data_filtered <- data %>%
  group_by(Name) %>%
  filter(Battles > 3) %>%
  ungroup()

# Convert variables to numeric
data_filtered <- data_filtered %>%
  mutate(Survival = as.numeric(parse_number(Survival)),
         WR = as.numeric(parse_number(WR)))

# Create box and whisker plots
survival_plot <- ggplot(data_filtered, aes(x = Survival, y = Nation)) +
  geom_boxplot() +
  labs(title = "Survival Rate by Country", x = "Survival Rate", y = "") +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 100))

win_plot <- ggplot(data_filtered, aes(x = WR, y = Nation)) +
  geom_boxplot() +
  labs(title = "Win Rate by Country", x = "Win Rate", y = "") +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 100))

# Arrange the plots side by side
grid.arrange(survival_plot, win_plot, ncol = 2)