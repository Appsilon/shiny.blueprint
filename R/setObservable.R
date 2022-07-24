#' Changes the state of the app (client-side)
#' @export
setObservable <- function(..., eventIdentifier = "\\(event\\)") {
  args <- list(...)
  id <- names(args)
  props <- args[[id]]
  jsCommandTxt <- sprintf('
    (e) => {
      jsmodule.appStateStore.changeState("%s", %s)
    }
  ', id, jsonlite::toJSON(props, auto_unbox = TRUE))
  # Turning string path into a reference to the event object
  jsCommandTxt <- gsub(sprintf('"%s', eventIdentifier), "", jsCommandTxt)
  jsCommandTxt <- gsub(sprintf("%s\"", eventIdentifier), "", jsCommandTxt)

  JS(jsCommandTxt)
}
