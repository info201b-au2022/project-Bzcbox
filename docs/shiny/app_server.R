#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

imgs <- list.files("/Users/jiajialin/Documents/info201/p3/project-template1/www/", pattern=".png", full.names = TRUE)

server <- function(input, output) {
    # TBD
  # output$image <-  renderImage({
  #   x <- imgs[index()] 
  #   list(src = x, alt = "alternate text")
  # }, deleteFile = FALSE)
}


