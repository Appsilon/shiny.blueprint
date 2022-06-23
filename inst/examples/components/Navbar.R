library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  Navbar(
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
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
