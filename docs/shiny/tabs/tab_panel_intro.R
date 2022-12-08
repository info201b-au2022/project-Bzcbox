# tab_panel_intro

library(shiny)

tab_panel_intro <-tabPanel(
    "Introduction",
    navlistPanel(
      "INTRODUCTION",
      tabPanel("Project Introduction",
               h2("Project introduction"),
               textOutput("intro")),
      "-----",
      "SUMMARY",
      tabPanel("Problem Domain",
               h2("Problem Domain"),
               textOutput("problem")),
      tabPanel("Research Question",
               h2("Research Question"),
               textOutput("question")),
      tabPanel("Key Dindings",
               h2("Key Dindings"),
               textOutput("finding")),
      "-----",
      "DATA",
      tabPanel("Datasets",
               textOutput("data"))
    )
)
