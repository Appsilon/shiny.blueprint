library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = reactOutput("ui"),
  server = function(input, output) {
    isOpen = reactiveVal(FALSE)
    observeEvent(input$hello, isOpen(TRUE))
    observeEvent(input$dismiss, isOpen(FALSE))

    output$ui <- renderReact({
      Popover(
        isOpen = isOpen(),
        target = Button.shinyInput("hello", "Say Hello", intent = "primary"),
        content = tags$div(
          style = "padding: 1em",
          H5("Hello!"),
          tags$p("Please read this message."),
          Button.shinyInput("dismiss", "Dismiss")
        )
      )
    })
  }
)
