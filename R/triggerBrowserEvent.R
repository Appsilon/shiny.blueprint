#' Trigger browser event
#' @export
triggerBrowserEvent <- function(inputId, props, eventIdentifier = "\\(event\\)") {
  jsCommandTxt <- sprintf('
    (e) => {
      console.log(e);
      window.dispatchEvent(new CustomEvent("%s", {detail: %s}))
    }
  ', inputId, jsonlite::toJSON(props, auto_unbox = TRUE))

  # Turning string path into a reference to the event object
  jsCommandTxt <- gsub(sprintf('"%s', eventIdentifier), "", jsCommandTxt)
  jsCommandTxt <- gsub(sprintf("%s\"", eventIdentifier), "", jsCommandTxt)

  JS(jsCommandTxt)
}