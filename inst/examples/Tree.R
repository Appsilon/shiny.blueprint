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

ui <- function(id) {
  ns <- NS(id)
  tagList(
    reactOutput(ns("tree")),
    Divider(),
    reactOutput(ns("info"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    treeReactive <- reactiveVal(treeList)
    observeEvent(input$expand, {
      treeReactive(
        modifyTree(treeReactive(), ids = input$expand$id, props = list(isExpanded = TRUE))
      )
    })
    observeEvent(input$collapse, {
      treeReactive(
        modifyTree(treeReactive(), ids = input$collapse$id, props = list(isExpanded = FALSE))
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
      UL(
        tags$li("Selected (id): ", input$click$id),
        tags$li("Selected (label): ", input$click$label)
      )
     })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
