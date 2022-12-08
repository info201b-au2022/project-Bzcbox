#----------------------------------------------------------------------------#
# tab_panel_Air_chart
#----------------------------------------------------------------------------#

library(shiny)

tab_panel_chart2 <-tabPanel(
    "Air Quality Chart",
    
    sidebarLayout(
      
      position = "left",
      
      sidebarPanel(
        h3("Graph Options"),
        
        br(),
        
        radioButtons("yaxis", h4("Select the variable for the y-axis:"),
                     choices = list(
                       "Atkinson Index (NO2 concentration)" = 1,
                       "Difference Between Low-Income-White and High-Income-White" = 2
                        ),selected = 1),
        
        br(),
        br(),
        br(),
        
        radioButtons("type", h4("Select Graph Type"),
                     choices = list("Scatter Plot" = 1,
                                    "Line Plot" = 2),selected = 1),
        
        width = 3
      ),
      
      mainPanel(
        plotlyOutput("plot2"),
        p("This graph best allows us to visualize how these wealth inequalities compare
          to trends in air pollutants, and whether there is a positive or negative correlation.
          We see that there is a high positive correlation between the two factors,
          meaning that income levels have a strong impact on the level of air pollution.")
      )
    )
)
