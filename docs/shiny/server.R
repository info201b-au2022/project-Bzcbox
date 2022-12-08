#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

source("../../source/table.R")
source("../../source/AirQualityChart.R")

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library(knitr)

server <- function(input, output) {
  
  # output$report <- renderUI({
  #   HTML(markdown::markdownToHTML(knit('tabs/report.md', quiet = TRUE)))
  # })

  output$plot1 <- renderPlotly({
    p1 <- covid_by_race %>%
        filter(race %in% input$data_c) %>%
        ggplot(aes(x = race, y = proportion_of_covid_death, fill = race)) +
        geom_col() +
        labs(title = "COVID-19 Deaths by Race Ratio",
             x = "Race",
             y = "Proportion of COVID Death") + theme(axis.text.x=element_blank())
    p <- ggplotly(p1)
    p
  })
  
  output$plot2 <- renderPlotly({
    if (input$yaxis == 1) {
      y_label <- "Atkinson Index"
    } else {
      y_label <- "Difference Between LIN and HIW"
    }
    
    if (input$type == 1) {
      AirGini_plot <- ggplot(data = AirGini) +
        geom_point(mapping = aes(x = Gini.Coefficient,
                                 if (input$yaxis == 1) {
                                   y = Atkinson.Index
                                 } else {
                                   y = Difference.Between.LIN.and.HIW..ppb.
                                 }), color = "blue") +
        labs(title = paste0("Gini Coefficient vs ", y_label),
             x = "Gini Coefficient (income inequality of the state)",
             y = y_label,
             p(""))
      p2 <- ggplotly(AirGini_plot)
    } else {
      AirGini_plot <- ggplot(data = AirGini, aes(x =  Gini.Coefficient,
                                                 if (input$yaxis == 1) {
                                                   y = Atkinson.Index
                                                 } else {
                                                   y = Difference.Between.LIN.and.HIW..ppb.
                                                 }), colour = "blue") +
        geom_line() +
        labs(title = paste0("Gini Coefficient vs ", y_label),
             x = "Gini Coefficient (income inequality of the state)",
             y = y_label,
             p("A Scatter Plot that shows the annual production-based emissions of
                carbon dioxide (CO₂) from gas, measured in million tonnes.
                We can see that the emission increases exponentially until 1973,
                then decreases untill 1986, and then increases overall.")
        )
      p1 <- ggplotly(AirGini_plot)
    }
    
  })
  
}
