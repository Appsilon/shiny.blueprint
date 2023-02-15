#' Run example
#'
#' Launch a Shiny example app or list the available examples.
#' Use `shiny.blueprint::runExample("showcase")` to run a showcase app with all the components.
#'
#' @param example The name of the example to run, or `NULL` to retrieve the list of examples.
#' @param ... Additional arguments to pass to `shiny::runApp()`.
#'
#' @export
runExample <- function(example = NULL, ...) {
  examples <- system.file("examples", package = utils::packageName(), mustWork = TRUE)
  if (is.null(example)) {
    sub("\\.R$", "", list.files(examples))
  } else {
    path <- file.path(examples, example)
    if (!grepl("\\.R$", path) && !file.exists(path)) {
      path <- paste0(path, ".R")
    }
    shiny::runApp(path, ...)
  }
}
