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
    H3("Select"),
    Select.shinyInput(
      inputId = ns("select"),
      items = paste("Option", LETTERS),
      selected = "Option C",
      noResults = "No options."
    ),
    uiOutput(ns("select_output")),
    H3("Select with labels"),
    Select.shinyInput(
      inputId = ns("select_lab"),
      items = top5Films,
      selected = "The Dark Knight"
    ),
    uiOutput(ns("select_lab_output"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$select_output <- renderText(input$select$text)
    output$select_lab_output <- renderText(input$select_lab$text)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
