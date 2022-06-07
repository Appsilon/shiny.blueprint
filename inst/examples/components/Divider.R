library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = ButtonGroup(
    minimal = TRUE,
    Button(text = "File"),
    Button(text = "Edit"),
    Divider(),
    Button(text = "Create"),
    Button(text = "Delete"),
    Divider(),
    Button(icon = "add"),
    Button(icon = "remove")
  ),
  server = function(input, output) {}
)
