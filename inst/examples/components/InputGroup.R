library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = div(
    style = "width: 20rem; display: grid; row-gap: 0.5rem",
    H4("Uncontrolled"),
    InputGroup(
      onChange = JS("(event) => Shiny.setInputValue('uncontrolledInputGroup', event.target.value)"),
      disabled = FALSE,
      large = TRUE,
      leftIcon = "filter",
      placeholder = "Filter histogram...",
      rightElement = Spinner(intent = "primary", size = 20)
    ),
    textOutput("uncontrolledInputGroupOutput"),
    H4("Controlled"),
    InputGroup.shinyInput(
      inputId = "controlledInputGroup",
      disabled = FALSE,
      large = FALSE,
      leftIcon = "home",
      placeholder = "Type something..."
    ),
    textOutput("controlledInputGroupOutput"),
    reactOutput("passwordExample"),
    textOutput("passwordOutput")
  ),
  server = function(input, output) {
    output$uncontrolledInputGroupOutput <- renderText(input$uncontrolledInputGroup)
    output$controlledInputGroupOutput <- renderText(input$controlledInputGroup)

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
