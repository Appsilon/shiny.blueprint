library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  tagList(
    Icon(icon = "cross"),
    Icon(icon = "globe", size = 20),
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
