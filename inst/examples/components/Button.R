library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    textOutput("clicks"),
    Button(
      onClick = triggerEvent("click1"),
      icon = "refresh",
      "Refresh"
    ),
    Button.shinyInput(
      inputId = "click2",
      rightIcon = "share",
      "Export"
    ),
    AnchorButton(
      onClick = triggerEvent("click3"),
      intent = "primary",
      "OK"
    ),
    AnchorButton.shinyInput(
      inputId = "click4",
      intent = "success",
      "Next"
    )
  ),
  server = function(input, output) {
    clicks <- reactiveVal(0)
    output$clicks <- renderText(paste("Clicks:", clicks()))
    observeEvent(input$click1, clicks(clicks() + 1))
    observeEvent(input$click2, clicks(clicks() + 1))
    observeEvent(input$click3, clicks(clicks() + 1))
    observeEvent(input$click4, clicks(clicks() + 1))
  }
)
