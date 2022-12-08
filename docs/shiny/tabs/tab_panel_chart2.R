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
        p("A visualization that shows the annual production-based emissions of
            carbon dioxide (CO₂) from gas, measured in million tonnes. The user
            can select the range of years to be displayed on the plot, from 1800
            to 2021. The user can also pick between scatter plot and line plot.
            We can see that the emission increases exponentially until 1973,
            then decreases untill 1986, and then increases overall.")
      )
    )
)
