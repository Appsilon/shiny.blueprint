library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = Navbar(
    NavbarGroup(
      NavbarHeading("Blueprint"),
      NavbarDivider(),
      Button(minimal = TRUE, icon = "home", text = "Home"),
      Button(minimal = TRUE, icon = "document", text = "Files")
    ),
    NavbarGroup(
      align = "right",
      Button(minimal = TRUE, icon = "user"),
      Button(minimal = TRUE, icon = "refresh")
    )
  ),
  server = function(input, output) {}
)
