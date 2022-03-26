library(shiny)
library(shiny.react)
library(shiny.blueprint)

shinyApp(
  ui = tagList(
    Button(text = "test", icon = "refresh"),
    Button(text = "test", icon = "refresh", disabled = "true"),
    Button(text = "test", icon = "refresh", loading = "true"),
    Button(text = "test", icon = "refresh", minimal = "true"),
    Button(text = "test", icon = "refresh", outlined = "true"),
    Button(text = "test", icon = "refresh", small = "true"),
    Button(text = "test", icon = "refresh", large = "true"),
    Button(text = "test", icon = "refresh", intent = "primary"),
    Button(icon = "refresh", intent = "danger"),
    Button.shinyInput(text = "Log it", inputId = "button"),
    ButtonGroup(
      Button(text = "File", icon = "database"),
      Button(text = "Edit", icon = "refresh"),
      Button(text = "View", icon = "function")
    ),
    ButtonGroup(minimal = "true",
      Button(text="File"),
      Button(text="Edit"),
      Divider(),
      Button(text="Create"),
      Button(text="Delete"),
      Divider(),
      Button(icon="add"),
      Button(icon="remove")
    ),
    ButtonGroup(vertical = "true",
      Button(text = "File", icon = "database"),
      Button(text = "Edit", icon = "refresh"),
      Button(text = "View", icon = "function")
    ),
    tags$h2(EditableText.shinyInput(inputId = "editable_header")),
    EditableText.shinyInput(inputId = "editable", multiline = "true", minLines = 3, maxLines = 12),
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
    Callout(title = "Visually important content", "The component is a simple wrapper around the CSS API that provides props for modifiers and optional title element. Any additional HTML props will be spread to the rendered element."
    ),
    Card(interactive = "true", 
      tags$h2(tags$a(href="#", "Analytical applications")),
      tags$p("User interfaces that enable people to interact smoothly with data, ask better questions, and make better decisions."),
      Button(intent = "primary", "Submit")
    ),
    reactOutput("collapse")
  ),
  server = function(input, output) {
    output$progress <- renderReact({
      ProgressBar(animate = input$animate)
    })
    output$collapse <- renderReact({
      Collapse(isOpen = input$animate,
      Pre("[11:53:30] Finished 'typescript-bundle-blueprint' after 769 ms
[11:53:30] Starting 'typescript-typings-blueprint'...
[11:53:30] Finished 'typescript-typings-blueprint' after 198 ms
[11:53:30] write ./blueprint.css
[11:53:30] Finished 'sass-compile-blueprint' after 2.84 s"))
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
