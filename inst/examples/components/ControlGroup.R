library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = ControlGroup(
    fill = FALSE,
    vertical = FALSE,
    HTMLSelect(options = rownames(mtcars)),
    InputGroup(placeholder = "Find car..."),
    Button(icon = "arrow-right"),
  ),
  server = function(input, output) {}
)
