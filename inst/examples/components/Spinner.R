library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = Spinner(intent = "primary", size = 100),
  server = function(input, output) {}
)
