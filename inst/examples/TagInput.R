library(shiny)
library(react.blueprint)


ui <- function(id) {
  ns <- NS(id)
  tagList(
    TagInput.shinyInput(
      inputId = ns("value"),
      value = c("one", "two", "three")
    ),
    textOutput(ns("valueOutput"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$valueOutput <- renderText(input$value)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
