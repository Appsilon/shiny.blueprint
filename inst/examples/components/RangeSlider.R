library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    # The uncontrolled slider value change works correctly but the component is not reactive
    RangeSlider(
      min = 0,
      max = 10,
      value = c(2, 4),
      stepSize = 0.1,
      labelStepSize = 10,
      onChange = setInput("uncontrolledRangeSlider")
    ),
    textOutput("uncontrolledRangeSliderOutput"),
    H4("Controlled"),
    RangeSlider.shinyInput(
      inputId = "controlledRangeSlider",
      min = 0,
      max = 10,
      stepSize = 0.1,
      labelStepSize = 10
    ),
    textOutput("controlledRangeSliderOutput")
  ),
  server = function(input, output) {
    output$uncontrolledRangeSliderOutput <- renderText(input$uncontrolledRangeSlider)
    output$controlledRangeSliderOutput <- renderText(input$controlledRangeSlider)
  }
)
