library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  div(
    style = "width: 20rem; display: grid; row-gap: 0.5rem",
    Button(
      onClick = setObservable(isOverlayOpen = TRUE),
      loading = listenTo(isLoading = FALSE),
      "Show overlay without server"
    ),
    Switch(
      defaultChecked = FALSE,
      label = "Loading buttons?",
      onChange = setObservable(isLoading = eventObject(".target.checked")),
    ),
    H3("More than one dependency"),
    H4("Modify the callout #1 and #2"),
    InputGroup(
      placeholder = "Change the title of the callout #1 & #2",
      onChange = setObservable(titleText = eventObject(".target.value"))
    ),
    InputGroup(
      placeholder = "Change the text of the callout #1 & #2",
      onChange = setObservable(bodyText = eventObject(".target.value"))
    ),
    Divider(),
    H4("Modify the callout #1 only"),
    InputGroup(
      value = listenTo(titleText1 = NA, titleText = NA),
      placeholder = "Change the title of the callout #1",
      onChange = setObservable(titleText1 = eventObject(".target.value"))
    ),
    InputGroup(
      value = listenTo(bodyText1 = NA, bodyText = NA),
      placeholder = "Change the text of the callout #1",
      onChange = setObservable(bodyText1 = eventObject(".target.value"))
    ),
    Callout(
      title = listenTo(titleText1 = NA, titleText = "Initial title to be displayed"),
      listenTo(bodyText1 = NA, bodyText = "You can now modify the component purely on the client side")
    ),
    Divider(),
    H4("Modify the callout #2 only"),
    InputGroup(
      value = listenTo(titleText2 = NA, titleText = NA),
      placeholder = "Change the title of the callout #2",
      onChange = setObservable(titleText2 = eventObject(".target.value"))
    ),
    InputGroup(
      value = listenTo(bodyText2 = NA, bodyText = NA),
      placeholder = "Change the text of the callout #2",
      onChange = setObservable(bodyText2 = eventObject(".target.value"))
    ),
    Callout(
      title = listenTo(titleText2 = NA, titleText = NA),
      listenTo(bodyText2 = NA, bodyText = NA)
    ),
    Divider(),
    H4("Below, you may see any latestes changes (listening to many):"),
    CustomComponent(
      "pre",
      listenTo(
        titleText = NA,
        titleText1 = NA,
        titleText2 = NA,
        bodyText = NA,
        bodyText1 = NA,
        bodyText2 = NA,
      )
    ),
    Overlay(
      usePortal = FALSE,
      isOpen = listenTo(isOverlayOpen = FALSE),
      Card(
        className = "bp4-elevation-4 bp4-dark bp4-overlay-content",
        interactive = FALSE,
        H5("An Overlay component that is closable without server"),
        tags$p(
          "Hello there!"
        ),
        Button(
          id = "closeOverlay",
          "Close me",
          onClick = setObservable(isOverlayOpen = FALSE)
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
