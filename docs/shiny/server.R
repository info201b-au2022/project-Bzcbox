#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#source
source("https://github.com/info201b-au2022/project-Bzcbox/raw/main/source/table.R")

imgs <- list.files("/Users/jiajialin/Documents/info201/p3/project-template1/www/", pattern=".png", full.names = TRUE)

server <- function(input, output) {
  
  
  output$plot <- renderPlot({
      covid_by_race %>%
      filter(race %in% input$data_c) %>%
    
    ggplot(aes(x = race, y = proportion_of_covid_death, fill = race)) +
      geom_col() +
      labs(title = "COVID-19 Deaths by Race Ratio",
           x = "Race",
           y = "Proportion of COVID Death") + theme(axis.text.x=element_blank())
  })
}


