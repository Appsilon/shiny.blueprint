library(shiny)
library(shiny.react)
library(shiny.blueprint)

shinyApp(
  ui = tagList(
    Switch(label = "Animate"),
    ProgressBar()
  ),
  server = function(input, output) {}
)
