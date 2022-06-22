library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = Label(
    "Label",
    tags$input(class = "bp4-input")
  ),
  server = function(input, output) {}
)
