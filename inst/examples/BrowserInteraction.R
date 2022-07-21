library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  div(
    style = "width: 20rem; display: grid; row-gap: 0.5rem",
    Button(
      # The button is dispatching an event to open the overlay
      onClick = triggerBrowserEvent(ns("overlay2"), list(isOpen = TRUE)),
      "Show overlay without server"
    ),
    InputGroup(
      placeholder = "Change the title of the callout",
      # Here you are binding your input with the callout component
      # The `eventObject` is allowing for dynamic interaction
      onChange = triggerBrowserEvent(ns("callout1"), list(title = eventObject("e.target.value")))
    ),
    Callout(
      inputId = ns("callout1"),
      title = "Initial title to be modified",
      "For now you can't modify children"
    ),
    Overlay(
      inputId = ns("overlay2"),
      usePortal = FALSE,
      isOpen = FALSE,
      onClose = triggerBrowserEvent(ns("overlay2"), list(isOpen = FALSE)),
      Card(
        className = "bp4-elevation-4 bp4-dark bp4-overlay-content",
        interactive = TRUE,
        H5("An Overlay component that is closable without server"),
        tags$p(
          "Hello there!"
        ),
        Button(
          "Close me",
          onClick = triggerBrowserEvent(ns("overlay2"), list(isOpen = FALSE))
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
