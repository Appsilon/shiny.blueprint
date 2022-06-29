library(shiny)
library(appsilon.blueprint)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0("x => Shiny.setInputValue('", inputId, "', x", accessor, ")"))
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    FileInput(
      onChange = setInput(ns("value1"), ".target.value"),
      text = "Please, choose a file...",
    ),
    textOutput(ns("value1Output")),
    FileInput.shinyInput(
      inputId = ns("value2"),
      value = "Please, choose a file..."
    ),
    textOutput(ns("value2Output"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$value1Output <- renderText(input$value1)
    output$value2Output <- renderText(input$value2)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
