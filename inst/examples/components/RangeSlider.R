library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    # RangeSlider must be controlled
    RangeSlider.shinyInput(
      inputId = ns("value"),
      min = 0,
      max = 10,
      stepSize = 0.1,
      labelStepSize = 10
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
