library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = Spinner(intent = "primary", size = 100),
  server = function(input, output) {}
)
