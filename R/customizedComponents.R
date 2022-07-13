#' Toaster
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/toast>
#' @export
Toaster <- R6::R6Class(
  classname = "Toaster",
  public = list(
    initialize = function(
      toasterId = "defaultToaster",
      session = shiny::getDefaultReactiveDomain(),
      ...
    ) {
      private$toasterId <- toasterId
      private$session <- session
      private$registerToaster(...)
    },
    show = function(..., key = runif(1)) {
      toastConfig <- list(...)
      private$session$sendCustomMessage(
        private$callName("show"),
        list(
          key = key,
          toastConfig = toastConfig
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
      paste0(prefix, private$toasterId)
    },
    registerToaster = function(...) {
      private$session$sendCustomMessage(
        "useToaster",
        list(toasterId = private$toasterId, ...)
      )
    }
  )
)
