library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    Button.shinyInput(
      inputId = ns("showOverlay"),
      "Show overlay"
    ),
    reactOutput(ns("overlay"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isOpen <- reactiveVal(FALSE)
    observeEvent(input$showOverlay, isOpen(TRUE))
    observeEvent(input$closeOverlay, isOpen(FALSE))

    output$overlay <- renderReact({
      Overlay(
        usePortal = FALSE,
        isOpen = isOpen(),
        onClose = triggerEvent(ns("closeOverlay")),
        Card(
          className = "bp4-elevation-4 bp4-dark bp4-overlay-content",
          interactive = TRUE,
          H5("Analytical applications"),
          tags$p(
          "User interfaces that enable people to interact smoothly with data,",
          " ask better questions, and make better decisions."
          ),
          Button.shinyInput(
            inputId = ns("closeOverlay"),
            "Close"
          )
        )
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
