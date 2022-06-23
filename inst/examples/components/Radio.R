library(appsilon.blueprint)
library(shiny)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0("x => Shiny.setInputValue('", inputId, "', x", accessor, ")"))
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H3("Favorite animal"),
    RadioGroup.shinyInput(
      inputId = ns("animal"),
      value = "dog",
      Radio(label = "Cat", value = "cat"),
      Radio(label = "Dog", value = "dog")
    ),
    textOutput(ns("favoriteAnimal")),
    H3("Favorite fruit"),
    reactOutput(ns("fruitRadio")),
    textOutput(ns("favoriteFruit"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$favoriteAnimal <- renderText(deparse(input$animal))

    fruit <- reactiveVal()
    observeEvent(input$fruit, fruit(input$fruit))
    output$fruitRadio <- renderReact({
      RadioGroup(
        onChange = setInput(ns("fruit"), ".currentTarget.value"),
        selectedValue = fruit(),
        Radio(label = "Apple", value = "a"),
        Radio(label = "Banana", value = "b"),
        Radio(label = "Cherry", value = "c")
      )
    })
    output$favoriteFruit <- renderText(deparse(fruit()))
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
