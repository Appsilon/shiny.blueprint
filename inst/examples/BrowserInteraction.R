library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  div(
    style = "width: 20rem; display: grid; row-gap: 0.5rem",
    Button(
      id = "openOverlay",
      # The button is dispatching an event to open the overlay
      onClick = modifyAppState("isOverlayOpen", TRUE),
      "Show overlay without server"
    ),
    InputGroup(
      placeholder = "Change the title of the callout",
      # Here you are binding your input with the callout component
      # The `eventObject` is allowing for dynamic interaction
      onChange = modifyAppState("titleText", eventObject("e.target.value"))
    ),
    InputGroup(
      placeholder = "Change the text of the callout",
      # Here you are binding your input with the callout component
      # The `eventObject` is allowing for dynamic interaction
      onChange = modifyAppState("bodyText", eventObject("e.target.value"))
    ),
    Callout(
      bindObservables = list(
        list(observer = "title", observable = "titleText"),
        list(observer = "children", observable = "bodyText")
      ),
      id = ns("callout1"),
      title = "Initial title to be modified",
      "You can now modify the component purely on the client side"
    ),
    Callout(
      bindObservables = list(
        list(observer = "title", observable = "titleText"),
        list(observer = "children", observable = "bodyText")
      ),
      id = ns("callout1"),
      title = "Initial title to be modified",
      "You can now modify the component purely on the client side"
    ),
    Overlay(
      bindObservables = list(
        list(observer = "isOpen", observable = "isOverlayOpen")
      ),
      id = ns("overlay2"),
      usePortal = FALSE,
      isOpen = FALSE,
      # onClose = modifyAppState(ns("overlay2"), list(isOpen = FALSE)),
      Card(
        id = "sda",
        className = "bp4-elevation-4 bp4-dark bp4-overlay-content",
        interactive = FALSE,
        H5("An Overlay component that is closable without server"),
        tags$p(
          "Hello there!"
        ),
        Button(
          bindObservables = list(
            list(observer = "children", observable = "titleText")
          ),
          id = "closeOverlay",
          "Close me",
          onClick = modifyAppState("isOverlayOpen", FALSE)
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
