library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  FormGroup(
    helperText = "Helper text with details...",
    label = "Label A",
    labelFor = "my-button",
    labelInfo = "(required)",
    inline = TRUE,
    Switch(
      defaultChecked = TRUE,
      label = "Apples"
    ),
    Switch(
      defaultChecked = TRUE,
      label = "Bananas"
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
