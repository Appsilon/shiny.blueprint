#' Changes the state of the app (client-side)
#' @export
modifyAppState <- function(id, props, eventIdentifier = "\\(event\\)") {
  jsCommandTxt <- sprintf('
    (e) => {
      jsmodule.appStateStore.changeState("%s", %s)
    }
  ', id, jsonlite::toJSON(props, auto_unbox = TRUE))
  # Turning string path into a reference to the event object
  jsCommandTxt <- gsub(sprintf('"%s', eventIdentifier), "", jsCommandTxt)
  jsCommandTxt <- gsub(sprintf("%s\"", eventIdentifier), "", jsCommandTxt)
  print(jsCommandTxt)

  JS(jsCommandTxt)
}