library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  ProgressBar(animate = TRUE)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
