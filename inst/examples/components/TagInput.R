library(shiny)
library(appsilon.blueprint)


ui <- function(id) {
  ns <- NS(id)
  # TagInput must be controlled
  tagList(
    TagInput.shinyInput(
      inputId = ns("controlledTagInput"),
      value = c("one", "two", "three")
    ),
    textOutput(ns("controlledTagInputOutput"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$controlledTagInputOutput <- renderText(input$controlledTagInput)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
