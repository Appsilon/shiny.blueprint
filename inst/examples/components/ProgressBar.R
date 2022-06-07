library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = ProgressBar(animate = TRUE),
  server = function(input, output) {}
)
