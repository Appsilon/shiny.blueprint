library(shiny)
library(shiny.blueprint)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    reactOutput(ns("multiSlider")),
    textOutput(ns("multiSliderOutput")),
    MultiSlider.shinyInput(
      inputId = ns("multiSliderShiny"),
      values = c(3, 6, 9)
    ),
    textOutput(ns("multiSliderShinyOutput")),
    MultiSlider.shinyInput(
      inputId = ns("multiSliderShiny2"),
      values = list(
        list(value = 3, type = "start", intentBefore = "danger"),
        list(value = 8, type = "start", intentBefore = "warning"),
        list(value = 14, type = "end", intentAfter = "warning"),
        list(value = 17, type = "end", intentAfter = "warning")
      ),
      min = 0,
      max = 20,
      defaultTrackIntent = "success"
    ),
    textOutput(ns("multiSliderShinyOutput2")),
  )
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

    output$multiSlider <- renderReact({
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
    output$multiSliderOutput <- renderText(
      paste(
        thresholds$dangerStart,
        thresholds$warningStart,
        thresholds$warningEnd,
        thresholds$dangerEnd,
        sep = ", "
      )
    )
    output$multiSliderShinyOutput <- renderText(
      paste(input$multiSliderShiny, collapse = ", ")
    )
    output$multiSliderShinyOutput2 <- renderText(
      paste(input$multiSliderShiny2, collapse = ", ")
    )
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
