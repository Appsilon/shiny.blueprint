library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    NonIdealState(
      icon = "search",
      title = "No search results",
      description = Card("Your search didn't match any files.\nTry searching for something else."),
      action = Button(text = "test", icon = "refresh")
    )
  ),
  server = function(input, output) {}
)
