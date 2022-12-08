# tab_panel_intro

library(shiny)

tab_panel_intro <- tabPanel(
    "Introduction",
    navlistPanel(
      "INTRODUCTION",
      tabPanel(
        # 
        "Project Introduction",
        # includeMarkdown("tabs/introduction.md")),
        fluidRow(
          column(
            7,
            includeMarkdown("tabs/introduction.md"),
            )
          )
        ),
      br(),
      
      "SUMMARY",
      tabPanel("Problem Domain",
               includeMarkdown("tabs/problem.md")),
      
      tabPanel(
        "Research Question",
        fluidRow(column(
                  7,
                  includeMarkdown("tabs/question.md")),
                 )
              ),
      
      tabPanel("Key Findings",
               fluidRow(
                 column(
                   7,
                   includeMarkdown("tabs/key.md")),
              )
            ),
      br(),
      
      "DATA",
      tabPanel("Datasets",
               fluidRow(
                 column(
                   7,
                   includeMarkdown("tabs/datasets.md")),
               )),
      widths = c(2, 8)
    )
)
