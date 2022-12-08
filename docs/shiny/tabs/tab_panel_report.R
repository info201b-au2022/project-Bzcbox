# tab_panel_report

library(shiny)
library("markdown")
library(readr)

tab_panel_report <- tabPanel(
  "Report",
  fluidRow(
    column(
      9,
      includeMarkdown("tabs/report.md")),
    )
  
)