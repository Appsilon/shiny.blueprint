#' @export
listenTo <- function(...) {
  list(observables = shiny.react::asProps(...))
}
