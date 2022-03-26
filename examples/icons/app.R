library(shiny)
library(shiny.react)
library(shiny.blueprint)

shinyApp(
  ui = tagList(
    Icon(icon = "cross"),
    Icon(icon = "globe", size = 20),
  ),
  server = function(input, output) {}
)
