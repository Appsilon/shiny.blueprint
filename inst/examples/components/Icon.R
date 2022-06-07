library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    Icon(icon = "cross"),
    Icon(icon = "globe", size = 20),
  ),
  server = function(input, output) {}
)
