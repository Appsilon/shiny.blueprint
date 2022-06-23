library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  reactOutput("tabs")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    currentTab <- reactiveVal("react")
    observeEvent(input$select_tab, current_tab(input$select_tab))
    output$tabs <- renderReact(
      Tabs(
        selectedTabId = currentTab(),
        onChange = setInput("select_tab"),
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
