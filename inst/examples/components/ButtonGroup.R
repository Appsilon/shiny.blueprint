library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = ButtonGroup(
    Button(icon = "database", "Queries"),
    Button(icon = "function", "Functions"),
    AnchorButton(rightIcon = "caret-down", "Options")
  ),
  server = function(input, output) {}
)
