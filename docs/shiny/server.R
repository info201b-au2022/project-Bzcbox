#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

source("../../source/table.R")

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

server <- function(input, output) {
  
  output$plot1 <- renderPlotly({
    p1 <-covid_by_race %>%
        filter(race %in% input$data_c) %>%
        ggplot(aes(x = race, y = proportion_of_covid_death, fill = race)) +
        geom_col() +
        labs(title = "COVID-19 Deaths by Race Ratio",
             x = "Race",
             y = "Proportion of COVID Death") + theme(axis.text.x=element_blank())
    p <- ggplotly(p1)
    p
  })
  
}
