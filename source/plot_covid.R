# plot_covid.R
# A source file that produce a histogram that visualize the COVID-19 dataset:

source("https://github.com/info201b-au2022/project-Bzcbox/raw/main/source/table.R")

# Load packages
library(dplyr)
library(ggplot2)

# plot the COVID-19 Deaths by Race Ratio
covid_chart <- ggplot(data = covid_by_race) +
  geom_col(mapping = aes(
    x = race,
    y = proportion_of_covid_death,
    fill = race
  )) + labs(title = "COVID-19 Deaths by Race Ratio") + theme(axis.text.x=element_blank())

covid_chart

input <- c("Hispanic", "Non-Hispanic White")

data <- covid_by_race %>%
  filter(race %in% c(input))
