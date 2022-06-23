library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  reactOutput("ui")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    isOpen <- reactiveVal(FALSE)
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
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
