#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("plotly")
library("markdown")
library("DT")
library("shinythemes")

source("tabs/tab_panel_intro.R")
source("tabs/tab_panel_chart1.R")
source("tabs/tab_panel_chart2.R")
source("tabs/tab_panel_summary.R")
source("tabs/tab_panel_report.R")

ui <- navbarPage(
  title = "Environmental Justice",
  position = "fixed-top",
  
  # The project introduction
  tab_panel_intro,
  
  # The three charts
  tab_panel_chart1,
  tab_panel_chart2,
  
  # The project summary
  tab_panel_summary,
  
  # The project report
  tab_panel_report,
  
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("INFO201 Final Project 16 - Donna Te,Steven He, Jiajia Lin"),
    hr()
  )
)
