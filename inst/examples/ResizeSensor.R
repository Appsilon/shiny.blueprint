library(shiny.blueprint)
library(shiny)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0(
    "x => Shiny.setInputValue('", inputId, "', x", accessor, ")"
  ))
}

printSize <- function(content) {
  paste0(content$width, "x", content$height)
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
    ),
    ResizeSensor.shinyInput(
      inputId = ns("resizeSensor"),
      content = div(
        textOutput(ns("resizeSensorInput")),
        style = "
          border: 1px solid black;
          width: 100px;
        "
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$size <- renderText({
      content <- req(input$resize)
      printSize(content)
    })
    output$resizeSensorInput <- renderText({
      content <- req(input$resizeSensor)
      printSize(content)
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
