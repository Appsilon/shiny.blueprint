#' Callout
#' @export
eventObject <- function(path, eventIdentifier = "(event)") {
  paste0(eventIdentifier, path, eventIdentifier)
}
