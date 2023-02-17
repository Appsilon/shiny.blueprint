library(shiny)
library(shiny.blueprint)

top5Films <- list(
  list(text = "The Shawshank Redemption", label = 1994),
  list(text = "The Godfather", label = 1972),
  list(text = "The Godfather: Part II", label = 1974),
  list(text = "The Dark Knight", label = 2008),
  list(text = "12 Angry Men", label = 1957)
)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H3("Suggest"),
    Suggest.shinyInput(
      inputId = ns("suggest"),
      items = paste("Option", LETTERS),
      inputProps = list(
        placeholder = "Search with Suggest..."
      )
    ),
    uiOutput(ns("suggest_output")),
    H3("Suggest with labels"),
    Suggest.shinyInput(
      inputId = ns("suggest_lab"),
      items = top5Films,
      noResults = "No suggestions."
    ),
    uiOutput(ns("suggest_lab_output"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$suggest_output <- renderText(input$suggest$text)
    output$suggest_lab_output <- renderText(input$suggest_lab$text)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
