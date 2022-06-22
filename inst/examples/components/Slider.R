library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    # The uncontrolled slider value change works correctly but the component is not reactive
    Slider(
      min = 0,
      max = 10,
      value = 5,
      stepSize = 0.1,
      labelStepSize = 10,
      onChange = setInput("uncontrolledSlider")
    ),
    textOutput("uncontrolledSliderOutput"),
    H4("Controlled"),
    Slider.shinyInput(
      inputId = "controlledSlider",
      min = 0,
      max = 10,
      stepSize = 0.1,
      labelStepSize = 10
    ),
    textOutput("controlledSliderOutput")
  ),
  server = function(input, output) {
    output$uncontrolledSliderOutput <- renderText(input$uncontrolledSlider)
    output$controlledSliderOutput <- renderText(input$controlledSlider)
  }
)
