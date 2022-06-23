library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  tagList(
    H2(EditableText(onChange = setInput("header"))),
    EditableText.shinyInput(
      inputId = "body",
      multiline = TRUE,
      minLines = 3, maxLines = 12
    ),
    textOutput("headerValue"),
    textOutput("bodyValue")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$headerValue <- renderText(paste("Header:", deparse(input$header)))
    output$bodyValue <- renderText(paste("Body:", deparse(input$body)))
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
