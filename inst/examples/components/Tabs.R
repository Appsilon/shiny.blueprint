library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = reactOutput("tabs"),
  server = function(input, output) {
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
  }
)
