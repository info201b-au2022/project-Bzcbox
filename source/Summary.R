library(tidyverse)
library(stringr)
source("https://github.com/info201b-au2022/project-Bzcbox/raw/main/source/table.R")
air_data <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-Bzcbox/main/data/Air%26SESStates.csv")

#data summary
summary_info <- list()

#number of total observation in the covid data.
summary_info$covid_num_observations <- nrow(covid)

#race that has the max deaths ratio in the covid data.
summary_info$covid_max_death_ratio_by_race <- covid_by_race %>%
  filter(proportion_of_covid_death == max(proportion_of_covid_death, na.rm = TRUE)) %>%
  pull(race)

#race that has the max deaths in the covid data.
summary_info$covid_max_death_by_race <- covid_by_race %>%
  filter(total_deaths == max(total_deaths, na.rm = TRUE)) %>%
  pull(race)

#state that has the max low income nonwhite population weighted concentration.
summary_info$ari_max_LIN_state <- air_data %>%
  filter(`Low-Income Nonwhite (LIN) Population-weighted Concentration (ppb)` == max(`Low-Income Nonwhite (LIN) Population-weighted Concentration (ppb)`)) %>%
  pull(State)

#state that has the max high income white population weighted concentration.
summary_info$ari_max_HIW_state <- air_data %>%
  filter(`High-Income White (HIW) Population-weighted Concentration (ppb)` == max(`High-Income White (HIW) Population-weighted Concentration (ppb)`)) %>%
  pull(State)
