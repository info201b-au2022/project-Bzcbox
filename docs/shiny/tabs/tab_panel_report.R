# tab_panel_report

library(shiny)
library("markdown")
library(readr)

tab_panel_report <- tabPanel(
  "Report",
  sidebarLayout(
    position="left",
    sidebarPanel(
      img(src="img/unprecedented-picture-of-the-sun-just-captured-by-stellar-sp_e6cg.1248.webp",width="100%")
    ),
    mainPanel(
      
      fluidRow(
        column(
          6,
          includeMarkdown("tabs/report.md")
        )
      )
    )
  )
)

tab_panel_repor <-tabPanel(
  "Report",

  fluidRow(
    column(
      6,
      includeMarkdown("tabs/report.md")
    )
  )
)

