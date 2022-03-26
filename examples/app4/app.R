library(shiny)
library(shiny.react)
library(shiny.blueprint)

shinyApp(
  ui = tagList(
    Spinner(),
    Spinner(intent = "danger"),
    Spinner(intent = "success", size = 150),
    Spinner(intent = "primary", size = 25, value = .55),
    Switch.shinyInput(
      inputId = "animate",
      value = TRUE,
      label = "Animate progress bar"
    ),
    reactOutput("progress")
  ),
  server = function(input, output) {
    output$progress <- renderReact({
      ProgressBar(animate = input$animate)
    })
  }
)
