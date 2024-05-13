library(shiny.blueprint)
library(purrr)
library(shiny)

treeList <- list(
  list(
    id = 0,
    hasCaret = TRUE,
    icon = "folder-close",
    label = "Tree"
  ),
  list(
    id = 1,
    icon = "folder-close",
    isExpanded = TRUE,
    label = "Hello here",
    childNodes = list(
      list(
        id = 2,
        icon = "document",
        label = "Item 0",
        secondaryLabel = Icon(icon = "eye-open")
      ),
      list(
        id = 3,
        icon = "tag",
        label = "Organic meditation gluten-free, sriracha VHS drinking vinegar beard man.",
        childNodes = list(
          list(
            id = 4,
            icon = "document",
            label = "Item 0",
            secondaryLabel = Icon(icon = "eye-open")
          ),
          list(
            id = 5,
            icon = "tag",
            label = "Some other stuff"
          )
        )
      )
    )
  ),
  list(
    id = 10,
    hasCaret = TRUE,
    icon = "folder-close",
    label = "Super secret files",
    disabled = TRUE
  )
)

modifyTree <- function(tree, ids, props) {
  if (!is.null(tree)) purrr::map(tree, function(node) {
    if (node$id %in% ids) {
      node <- purrr::list_modify(node, !!!props)
    }
    node$childNodes <- modifyTree(node$childNodes, ids, props)
    node
  })
}

setInput <- partial(shiny.react::setInput, jsAccessor = "[0].id")

ui <- function(id) {
  ns <- NS(id)
  tagList(
    reactOutput(ns("tree")),
    Divider(),
    reactOutput(ns("info")),
    Divider(),
    Tree.shinyInput(
      inputId = ns("selected_nodes"),
      data = list(
        list(
          label = "1",
          isExpanded = TRUE,
          childNodes = list(
            list(
              label = "1.1",
              childNodes = list(list(label = "1.1.1"))
            ),
            list(label = "1.2")
          )
        ),
        list(
          label = "2",
          childNodes = list(
            list(label = "2.1")
          )
        ),
        list(label = "3", hasCaret = TRUE)
      )
    ),
    Divider(),
    tags$span("Hold ", tags$b("shift"), " to select multiple nodes."),
    reactOutput(ns("selected_nodes_list")),
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    treeReactive <- reactiveVal(treeList)
    observeEvent(input$expand, {
      treeReactive(
        modifyTree(treeReactive(), ids = input$expand, props = list(isExpanded = TRUE))
      )
    })
    observeEvent(input$collapse, {
      treeReactive(
        modifyTree(treeReactive(), ids = input$collapse, props = list(isExpanded = FALSE))
      )
    })

    output$tree <- renderReact({
      Tree(
        contents = treeReactive(),
        onNodeExpand = setInput(ns("expand")),
        onNodeCollapse = setInput(ns("collapse")),
        onNodeClick = setInput(ns("click"))
      )
    })

    output$info <- renderReact({
      tags$div("Clicked (id): ", input$click)
    })

    output$selected_nodes_list <- renderReact({
      UL(lapply(input$selected_nodes, function(node) tags$li(node)))
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
