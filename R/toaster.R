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
#' @description
#' Documentation: <https://blueprintjs.com/docs/#core/components/toast>
#'
#' @export
Toaster <- R6::R6Class(
  classname = "Toaster",
  public = list(
    #' @param toasterId Unique number - needed to use more than one toaster
    #' @param session Shiny session object
    #' @param ... Parameters passed to `Toaster` component
    initialize = function(
      toasterId = incrementToasterId(),
      session = shiny::getDefaultReactiveDomain(),
      ...
    ) {
      private$toasterId <- addBlueprintPrefix(toasterId)
      private$session <- session
      private$registerToaster(...)
    },

    #' @description Shows a new toast to the user, or updates an existing toast
    #' corresponding to the provided key
    #' @param ... Parameters passed to `Toaster` component
    #' @param key A key of toast to be shown/dismissed
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

    #' @description Dismiss all toasts instantly
    clear = function() {
      private$session$sendCustomMessage(
        private$callName("clear"),
        list()
      )
    },

    #' @description Dismiss the given toast instantly
    #' @param key A key of toast to be shown/dismissed
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
