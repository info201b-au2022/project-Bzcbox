# table.R
# A source file that produce a table of aggregate information about it:

#     Load the tidyverse package.
library(tidyverse)

covid <- read.csv('https://raw.githubusercontent.com/info201b-au2022/project-Bzcbox/main/data/covid_19_data.csv')

covid <- covid %>%
  rename(race = Race.Hispanic.origin, COVID_19_deaths = Count.of.COVID.19.deaths)

covid_group <- covid %>%
  group_by(race) %>%
  summarize(total_deaths = round(sum(COVID_19_deaths, na.rm = TRUE), digits = 0))
  
  