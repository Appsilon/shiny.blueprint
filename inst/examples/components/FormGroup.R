library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = FormGroup(
    helperText = "Helper text with details...",
    label = "Label A",
    labelFor = "my-button",
    labelInfo = "(required)",
    inline = TRUE,
    Switch(
      defaultChecked = TRUE,
      label = "Apples"
    ),
    Switch(
      defaultChecked = TRUE,
      label = "Bananas"
    )
  ),
  server = function(input, output) {}
)
