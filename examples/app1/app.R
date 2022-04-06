library(shiny)
library(shiny.react)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    Switch(label = "Animate"),
    ProgressBar()
  ),
  server = function(input, output) {}
)
