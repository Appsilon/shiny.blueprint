library(shiny)
library(appsilon.blueprint)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0("x => Shiny.setInputValue('", inputId, "', x", accessor, ")"))
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H4("Uncontrolled"),
    FileInput(
      onChange = setInput(ns("uncontrolledFileInput"), ".target.value"),
      text = "Please, choose a file...",
    ),
    textOutput(ns("uncontrolledFileinputOutput")),
    H4("Controlled"),
    FileInput.shinyInput(
      inputId = ns("controlledFileInput"),
      value = "Please, choose a file..."
    ),
    textOutput(ns("controlledFileinputOutput"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$uncontrolledFileinputOutput <- renderText(input$uncontrolledFileInput)
    output$controlledFileinputOutput <- renderText(input$controlledFileInput)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
