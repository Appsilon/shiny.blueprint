library(shiny)
library(shiny.react)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    Navbar(
      NavbarGroup(
        NavbarHeading("Blueprint"),
        NavbarDivider(),
        Button(minimal = "true", icon="home", text="Home"),
        Button(minimal = "true", icon="document", text="Files")
      ),
      NavbarGroup(align="right",
        Button(minimal = "true", icon="user"),
        Button(minimal = "true", icon="refresh")
      )
    )
  ),
  server = function(input, output) {}
)
