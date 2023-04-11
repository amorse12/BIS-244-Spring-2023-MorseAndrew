rm(list=ls(all=TRUE))
cat("\014")

library(readr)
library(dplyr)
library(ggplot2)

df <- read_csv("/Users/drewmorse/Downloads/Covid.csv")
df <- df %>%
  group_by(countriesAndTerritories, dateRep) %>%
  summarize(total_cases = sum(cases))

df <- df %>%
  filter(countriesAndTerritories %in% c("France", "Germany", "Greece", "Italy", "Netherlands", "Spain"))

ggplot(df, aes(x = dateRep, y = total_cases, color = countriesAndTerritories)) +
  geom_line() +
  facet_wrap(~ countriesAndTerritories) +
  scale_x_date(date_breaks = "4 months", date_labels = "%b %Y") +
  labs(title = "Covid-19 Case Counts",
       subtitle = "By Drew Morse as of 3-26-2023",
       x = "Date",
       y = "New Cases per Day",
       color = "Country") +
  theme_classic()
