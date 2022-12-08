# tab_panel_chart1

library(shiny)
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
                           selected = race)
      ),
      mainPanel( 
        plotOutput("plot"),
      )
    )
)

