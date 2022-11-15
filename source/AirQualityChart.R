#Loading Packages 
library(ggplot2)
library(tidyverse)

setwd("~/info201/project-Bzcbox/source")

#Load data from csv file
AirGini <- read.csv("https://github.com/info201b-au2022/project-Bzcbox/raw/main/data/Air%26SESStates.csv")

#Rename Atkinson Column 
AirGini <- AirGini %>%
  rename ("Atkinson.Index" = "Atkinson.Index..e.0.75.")

#Scatterplot
AirGini_plot <- ggplot(data = AirGini) +
  geom_point(mapping = aes(x = Gini.Coefficient, y = Atkinson.Index), color = "blue") +
  labs(title = "Gini Coefficient vs Atkinson Index")  
AirGini_plot