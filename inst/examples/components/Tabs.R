library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    reactOutput("tabs")
  ),
  server = function(input, output) {
    current_tab <- reactiveVal("rx")
    observeEvent(input$select_tab, current_tab(input$select_tab))
    output$tabs <- renderReact(
      Tabs(
        id = "TabsExample",
        selectedTabId = current_tab(),
        onChange = setInput("select_tab"),
        Tab(id = "ng", title = "Angular", panel = "Angular"),
        Tab(id = "mb", title = "Ember", panel = "Ember"),
        Tab(id = "rx", title = "React", panel = "React"),
        Expander(),
        tags$input(class = "bp4-input", type = "text", placeholder = "Search...")
      )
    )
  }
)
