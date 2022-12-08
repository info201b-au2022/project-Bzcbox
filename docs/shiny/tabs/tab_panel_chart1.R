# tab_panel_chart1

library(shiny)
library(ggplot2)
library(plotly)

race <- c("Hispanic" = "Hispanic",
          "Non-Hispanic White" = "Non-Hispanic White",
          "Non-Hispanic Black" = "Non-Hispanic Black",
          "Non-Hispanic Asian" = "Non-Hispanic Asian",
          "Non-Hispanic Native Hawaiian or Other Pacific Islander" = "Non-Hispanic Native Hawaiian or Other Pacific Islander",
          "Non-Hispanic American Indian or Alaska Native" = "Non-Hispanic American Indian or Alaska Native")

tab_panel_chart1 <-tabPanel(
    "COVID Chart",
    sidebarLayout(
      position = "left",
      sidebarPanel(
        h1("Filter"), 
        checkboxGroupInput(inputId = "data_c",
                           label = "Select race to plot",
                           choices = race,
                           selected = race),
        width = 4
      ),
      mainPanel( 
        plotlyOutput("plot1"),
        p("From this aggregated table, we were able to see that Non-Hispanic White 
          individuals had the greatest number of deaths. Although at first glance it was surprising, 
          when observing the proportion of covid deaths, it revealed a significant finding. 
          Because the number of non-white hispanic individuals who were recorded in data was so large,
          there was also a large number of deaths. Upon looking at the proportions, Non-Hispanic American 
          Indian or Alaska Native and Non-Hispanic Black individuals had the highest proportion of deaths due to covid Pandemic.")
      )
    )
)

