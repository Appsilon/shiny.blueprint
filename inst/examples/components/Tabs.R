library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  reactOutput("tabs")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    currentTab <- reactiveVal("react")
    observeEvent(input$selectTab, currentTab(input$selectTab))
    output$tabs <- renderReact(
      Tabs(
        selectedTabId = currentTab(),
        onChange = setInput("selectTab"),
        Tab(id = "angular", title = "Angular", panel = "Angular"),
        Tab(id = "ember", title = "Ember", panel = "Ember"),
        Tab(id = "react", title = "React", panel = "React"),
        TabsExpander(),
        tags$input(class = "bp4-input", type = "text", placeholder = "Search...")
      )
    )
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
