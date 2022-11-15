# table.R
# A source file that produce a table of aggregate information about it:

#     Load the tidyverse package.
library(tidyverse)

covid <- read.csv('https://raw.githubusercontent.com/info201b-au2022/project-Bzcbox/main/data/covid_19_data.csv')

population <- read.csv('https://github.com/info201b-au2022/project-Bzcbox/raw/main/data/population_usafacts.csv')

# Dataset clean up
population_by_race <- population[297:306,]

population_by_race <- population_by_race %>%
  select(Years, X2020)

population_by_race <- population_by_race[complete.cases(population_by_race), ]

population_by_race <- population_by_race %>%
  rename(race = Years, population_2020 = X2020)
  
population_by_race[1,]$race = 'Hispanic'
population_by_race[2,]$race = 'Non-Hispanic White'
population_by_race[3,]$race = 'Non-Hispanic Black'
population_by_race[4,]$race = 'Non-Hispanic Asian or Pacific Islander'
population_by_race[5,]$race = 'Non-Hispanic Asian'
population_by_race[6,]$race = 'Non-Hispanic Native Hawaiian or Other Pacific Islander'
population_by_race[7,]$race = 'Non-Hispanic American Indian or Alaska Native'
population_by_race[8,]$race = 'Other'

covid <- covid %>%
  rename(race = Race.Hispanic.origin, COVID_19_deaths = Count.of.COVID.19.deaths)

covid_group <- covid %>%
  group_by(race) %>%
  summarize(total_deaths = round(sum(COVID_19_deaths, na.rm = TRUE), digits = 0))

covid_by_race <- right_join(population_by_race, covid_group, by="race")

covid_by_race <- mutate(covid_by_race, proportion_of_covid_death = total_deaths / population_2020)

covid_by_race