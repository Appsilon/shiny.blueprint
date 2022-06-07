library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = ProgressBar(animate = TRUE),
  server = function(input, output) {}
)
