handlersObject <- function(ns) {
  paste0("window.jsmodule['@/shiny.blueprint'].panelStackHandlers['", ns, "']")
}

#' @rdname PanelStack
#' @param panelId Id of the panel to be closed
#' @export
openPanel <- function(panelId, ns = "ps") {
  JS(paste0(
    "() => ", handlersObject(ns), ".openPanel('", panelId, "')"
  ))
}

#' @rdname PanelStack
#' @export
closePanel <- function(ns = "ps") {
  JS("() => ", handlersObject(ns), ".closePanel()")
}
