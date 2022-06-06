library(shiny)
library(shiny.react)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    Icon(icon = "cross"),
    Icon(icon = "globe", size = 20),
  ),
  server = function(input, output) {}
)
