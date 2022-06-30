library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  ButtonGroup(
    minimal = TRUE,
    Button(text = "File"),
    Button(text = "Edit"),
    Divider(),
    Button(text = "Create"),
    Button(text = "Delete"),
    Divider(),
    Button(icon = "add"),
    Button(icon = "remove")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
