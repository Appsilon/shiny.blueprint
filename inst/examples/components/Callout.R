library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = Callout(
    title = "Visually important content",
    "The component is a simple wrapper around the CSS API",
    " that provides props for modifiers and optional title element.",
    " Any additional HTML props will be spread to the rendered ", Code("div"), " element."
  ),
  server = function(input, output) {}
)
