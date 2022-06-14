library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
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
  ),
  server = function(input, output) {
    output$size <- renderText({
      content <- req(input$resize)
      paste0(content$width, "x", content$height)
    })
  }
)
