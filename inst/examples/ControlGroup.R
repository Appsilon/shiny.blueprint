library(react.blueprint)
library(shiny)

ui <- function(id) {
  ControlGroup(
    HTMLSelect(options = rownames(mtcars)),
    InputGroup(placeholder = "Find car..."),
    Button(icon = "arrow-right"),
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
