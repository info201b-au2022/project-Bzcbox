# plot_covid.R
# A source file that produce a histogram that visualize the COVID-19 dataset:

source("https://github.com/info201b-au2022/project-Bzcbox/raw/main/source/table.R")

library(tidyverse)
library(ggplot2)

h1 <- ggplot(data = covid_by_race) +
  geom_col(mapping = aes(
    x = race,
    y = proportion_of_covid_death,
    fill = race
  )) + labs(title = "COVID-19 Deaths by Race Ratio")

h1