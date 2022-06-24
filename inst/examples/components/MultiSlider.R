library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  ns <- NS(id)
  reactOutput(ns("multiSliderOutput"))
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    thresholds <- reactiveValues(
      dangerStart = 3,
      warningStart = 8,
      warningEnd = 14,
      dangerEnd = 17
    )

    observeEvent(input$mutliSliderInput, {
      sliderValues <- sort(input$mutliSliderInput)
      thresholds$dangerStart <- sliderValues[1]
      thresholds$warningStart <- sliderValues[2]
      thresholds$warningEnd <- sliderValues[3]
      thresholds$dangerEnd <- sliderValues[4]
    })

    output$multiSliderOutput <- renderReact({
      MultiSlider(
        defaultTrackIntent = "success",
        onChange = setInput(ns("mutliSliderInput")),
        stepSize = 1,
        min = 0,
        max = 20,
        MultiSliderHandle(
          type = "start",
          intentBefore = "danger",
          value = thresholds$dangerStart,
          interactionKind = "push"
        ),
        MultiSliderHandle(
          type = "start",
          intentBefore = "warning",
          value = thresholds$warningStart,
          interactionKind = "push"
        ),
        MultiSliderHandle(
          type = "end",
          intentAfter = "warning",
          value = thresholds$warningEnd,
          interactionKind = "push"
        ),
        MultiSliderHandle(
          type = "end",
          intentAfter = "danger",
          value = thresholds$dangerEnd,
          interactionKind = "push"
        )
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
