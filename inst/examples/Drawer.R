library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    Button.shinyInput(ns("hello"), "Say Hello", intent = "primary"),
    reactOutput(ns("ui"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isOpen <- reactiveVal(FALSE)
    observeEvent(input$hello, isOpen(!isOpen()))
    observeEvent(input$dismissDrawer, isOpen(FALSE))

    output$ui <- renderReact({
      Drawer(
        isOpen = isOpen(),
        onClose = triggerEvent(ns("dismissDrawer")),
        usePortal = FALSE,
        title = "Hello",
        icon = "info-sign",
        div(
          class = "bp4-dialog-body",
          p("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
        )
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
