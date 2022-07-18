createIdIncrementationFunction <- function(initialId = 1, incrementBy = 1) {
  currentId <- initialId
  function() {
    on.exit({
      currentId <<- currentId + incrementBy
    })
    currentId
  }
}

incrementToasterId <- createIdIncrementationFunction()

#' Toaster
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/toast>
#' @export
Toaster <- R6::R6Class(
  classname = "Toaster",
  public = list(
    initialize = function(
      toasterId = incrementToasterId(),
      session = shiny::getDefaultReactiveDomain(),
      ...
    ) {
      private$toasterId <- addBlueprintPrefix(toasterId)
      private$session <- session
      private$registerToaster(...)
    },
    show = function(..., key = NULL) {
      props <- list(...)
      private$session$sendCustomMessage(
        private$callName("show"),
        list(
          key = key,
          props = props
        )
      )
    },
    clear = function() {
      private$session$sendCustomMessage(
        private$callName("clear"),
        list()
      )
    },
    dismiss = function(key) {
      private$session$sendCustomMessage(
        private$callName("dismiss"),
        list(key = key)
      )
    }
  ),
  private = list(
    toasterId = NULL,
    session = NULL,
    callName = function(prefix) {
      addBlueprintPrefix(paste0(prefix, private$toasterId))
    },
    registerToaster = function(...) {
      private$session$sendCustomMessage(
        addBlueprintPrefix("createToaster"),
        list(toasterId = private$toasterId, ...)
      )
    }
  )
)
