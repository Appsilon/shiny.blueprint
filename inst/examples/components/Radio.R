library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  tagList(
    H3("Favorite animal"),
    RadioGroup.shinyInput(
      inputId = "animal",
      value = "dog",
      Radio(label = "Cat", value = "cat"),
      Radio(label = "Dog", value = "dog")
    ),
    textOutput("favoriteAnimal"),
    H3("Favorite fruit"),
    reactOutput("fruitRadio"),
    textOutput("favoriteFruit")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$favoriteAnimal <- renderText(deparse(input$animal))

    fruit <- reactiveVal()
    observeEvent(input$fruit, fruit(input$fruit))
    output$fruitRadio <- renderReact({
      RadioGroup(
        onChange = JS("event => Shiny.setInputValue('fruit', event.currentTarget.value)"),
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
