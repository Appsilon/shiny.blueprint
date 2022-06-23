library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H2(EditableText(onChange = setInput(ns("header")))),
    EditableText.shinyInput(
      inputId = ns("body"),
      multiline = TRUE,
      minLines = 3, maxLines = 12
    ),
    textOutput(ns("headerValue")),
    textOutput(ns("bodyValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$headerValue <- renderText(paste("Header:", deparse(input$header)))
    output$bodyValue <- renderText(paste("Body:", deparse(input$body)))
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
