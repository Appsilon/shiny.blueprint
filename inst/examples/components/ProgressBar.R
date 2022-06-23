library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  ProgressBar(animate = TRUE)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
