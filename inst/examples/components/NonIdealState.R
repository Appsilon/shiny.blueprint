library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  NonIdealState(
    icon = "search",
    title = "No search results",
    description = Card(
      "Your search didn't match any files.",
      tags$br(),
      "Try searching for something else, or create a new file."
    ),
    action = Button(icon = "plus", text = "New file", intent = "primary", outlined = TRUE)
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
