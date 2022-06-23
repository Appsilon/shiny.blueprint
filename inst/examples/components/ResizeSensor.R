library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
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
      onResize = JS("entries => Shiny.setInputValue('resize', entries[0].contentRect)"),
      div(
        class = "resizable",
        textOutput("size")
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
