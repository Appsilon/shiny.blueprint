library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    Button(text = "test", icon = "refresh"),
    Button(text = "test", icon = "refresh", disabled = TRUE),
    Button(text = "test", icon = "refresh", loading = TRUE),
    Button(text = "test", icon = "refresh", minimal = TRUE),
    Button(text = "test", icon = "refresh", outlined = TRUE),
    Button(text = "test", icon = "refresh", small = TRUE),
    Button(text = "test", icon = "refresh", large = TRUE),
    Button(text = "test", icon = "refresh", intent = "primary"),
    Button(icon = "refresh", intent = "danger"),
    Button.shinyInput(text = "Log it", inputId = "button"),
    ButtonGroup(
      Button(text = "File", icon = "database"),
      Button(text = "Edit", icon = "refresh"),
      Button(text = "View", icon = "function")
    ),
    ButtonGroup(
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
    ButtonGroup(
      vertical = TRUE,
      Button(text = "File", icon = "database"),
      Button(text = "Edit", icon = "refresh"),
      Button(text = "View", icon = "function")
    ),
    tags$h2(EditableText.shinyInput(inputId = "editable_header")),
    EditableText.shinyInput(inputId = "editable", multiline = TRUE, minLines = 3, maxLines = 12),
    Spinner(),
    Spinner(intent = "danger"),
    Spinner(intent = "success", size = 150),
    Spinner(intent = "primary", size = 25, value = .55),
    Switch.shinyInput(
      inputId = "animate",
      value = TRUE,
      label = "Animate progress bar"
    ),
    reactOutput("progress"),
    Callout(
      title = "Visually important content",
      paste(
        "The component is a simple wrapper around the CSS API",
        "that provides props for modifiers and optional title element.",
        "Any additional HTML props will be spread to the rendered element."
      )
    ),
    Card(
      interactive = TRUE,
      tags$h2(tags$a(href = "#", "Analytical applications")),
      tags$p(paste(
        "User interfaces that enable people to interact smoothly with data,",
        "ask better questions, and make better decisions."
      )),
      Button(intent = "primary", "Submit")
    ),
    reactOutput("collapse")
  ),
  server = function(input, output) {
    output$progress <- renderReact({
      ProgressBar(animate = input$animate)
    })
    output$collapse <- renderReact({
      Collapse(
        isOpen = input$animate,
        Pre("[11:53:30] Finished 'typescript-bundle-blueprint' after 769 ms
[11:53:30] Starting 'typescript-typings-blueprint'...
[11:53:30] Finished 'typescript-typings-blueprint' after 198 ms
[11:53:30] write ./blueprint.css
[11:53:30] Finished 'sass-compile-blueprint' after 2.84 s")
      )
    })
    observe({
      input$button
      print("clicked!")
    })
    observe({
      print(input$editable)
    })
  }
)
