library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = div(
    style = "width: 20rem; display: grid; row-gap: 0.5rem",
    InputGroup(
      asyncControl = TRUE,
      disabled = FALSE,
      large = TRUE,
      leftIcon = "filter",
      placeholder = "Filter histogram...",
      rightElement = Spinner(intent = "primary", size = 20)
    ),
    InputGroup.shinyInput(
      inputId = "inputGroup2",
      asyncControl = FALSE,
      disabled = FALSE,
      large = FALSE,
      leftIcon = "home",
      placeholder = "Type something..."
    ),
    textOutput("inputGroup2"),
    reactOutput("passwordExample"),
    textOutput("passwordOutput")
  ),
  server = function(input, output) {
    output$inputGroup2 <- renderText(input$inputGroup2)

    isLocked <- reactiveVal(TRUE)

    observeEvent(input$toggleLock, isLocked(!isLocked()))
    output$passwordOutput <- renderText(input$passwordInput)

    output$passwordExample <- renderReact({
      lockButton <- Button.shinyInput(
        inputId = "toggleLock",
        icon = ifelse(isLocked(), "lock", "unlock"),
        minimal = TRUE,
        intent = "warning"
      )
      InputGroup.shinyInput(
        inputId = "passwordInput",
        disabled = FALSE,
        large = FALSE,
        rightElement = lockButton,
        placeholder = "Enter your password...",
        type = ifelse(isLocked(), "password", "text")
      )
    })
  }
)
