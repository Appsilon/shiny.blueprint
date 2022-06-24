library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Slider must be controlled
    Slider.shinyInput(
      inputId = ns("controlledSlider"),
      min = 0,
      max = 10,
      stepSize = 0.1,
      labelStepSize = 10
    ),
    textOutput(ns("controlledSliderOutput"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$controlledSliderOutput <- renderText(input$controlledSlider)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
