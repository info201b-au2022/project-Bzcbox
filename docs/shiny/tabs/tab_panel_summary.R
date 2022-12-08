# tab_panel_summary

library(shiny)

tab_panel_summary <-tabPanel(
    "Takeaways",
    includeMarkdown("tabs/takeaways.md"),
)

