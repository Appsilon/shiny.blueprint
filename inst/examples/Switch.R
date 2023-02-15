library(react.blueprint)
library(shiny)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0("x => Shiny.setInputValue('", inputId, "', x", accessor, ")"))
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    Switch(
      onChange = setInput(ns("apples"), ".target.checked"),
      defaultChecked = TRUE,
      label = "Apples"
    ),
    Switch.shinyInput(
      inputId = ns("bananas"),
      value = TRUE,
      label = "Bananas"
    ),
    textOutput(ns("applesEnabled")),
    textOutput(ns("bananasEnabled"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$applesEnabled <- renderText(paste("Apples:", deparse(input$apples)))
    output$bananasEnabled <- renderText(paste("Bananas:", deparse(input$bananas)))
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
