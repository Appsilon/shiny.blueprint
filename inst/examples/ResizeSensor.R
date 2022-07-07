library(appsilon.blueprint)
library(shiny)

setInput <- function(inputId, accessor = NULL) {
  # Use ShinyProxy to avoid an exception on app startup:
  JS(paste0(
    "x => jsmodule['@/shiny.react'].ShinyProxy.setInputValue",
    "('", inputId, "', x", accessor, ")"
  ))
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$style("
      .resizable {
        overflow: auto;
        resize: both;
        width: 100px;
        height: 100px;
        background: silver;
      }
    "),
    ResizeSensor(
      onResize = setInput(ns("resize"), "[0].contentRect"),
      div(
        class = "resizable",
        textOutput(ns("size"))
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$size <- renderText({
      content <- req(input$resize)
      paste0(content$width, "x", content$height)
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
