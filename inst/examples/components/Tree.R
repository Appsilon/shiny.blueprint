library(shiny)
library(appsilon.blueprint)
library(purrr)

tree_list <- list(
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
        secondaryLabel = "An eye"
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
            secondaryLabel = "An eye"
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


#' Helper function to modify the list
modify_tree <- function(tree, ids, props) {
  recur <- function(items, ids = NULL, props) {
    purrr::map(items, function(item) {
      if (item$id %in% ids) {
        item <- purrr::list_modify(item, !!!props)
      }
      item$childNodes <- purrr::map(item$childNodes, function(child) {
        if (child$id %in% ids) {
          child <- purrr::list_modify(child, !!!props)
        }
        child$childNodes <- recur(child$childNodes, ids, props)
        child
      })
      item
    })
  }
  recur(tree, ids = ids, props = props)
}

if (interactive()) shinyApp(
  ui = tagList(
    reactOutput("tree")
  ),
  server = function(input, output) {

    tree_reactive <- reactiveVal(tree_list)

    observeEvent(input$expand, {
      tree_reactive(
        modify_tree(tree_reactive(), ids = input$expand$id, props = list(isExpanded = TRUE))
      )
    })

    observeEvent(input$collapse, {
      tree_reactive(
        modify_tree(tree_reactive(), ids = input$collapse$id, props = list(isExpanded = FALSE))
      )
    })

    output$tree <- renderReact({
      Tree(
        contents = tree_reactive(),
        onNodeExpand = setInput("expand"),
        onNodeCollapse = setInput("collapse")
      )
    })
  }
)
