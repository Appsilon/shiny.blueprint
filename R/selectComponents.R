SelectFactory <- function(name) {
  function(
    inputId,
    items,
    ...
    ) {
    purrr::walk(items, ~ checkmate::assert_subset(
      c("label", "rightLabel", "key"),
      names(.x)
    ))
    shiny.react::reactElement(
      module = "@/appsilon.blueprint",
      name = name,
      props = shiny.react::asProps(
        inputId = inputId,
        items = items,
        ...
      ),
      deps = blueprintDependency()
    )
  }
}

#' Select
#'
#' Documentation: <https://blueprintjs.com/docs/#select/select>
#'
#' @example inst/examples/Select.R
#' @inherit template params
#' @param items A list of options (containing `key`, `label` and `rightLabel` keys)
#' @export
Select <- SelectFactory("Select")

#' Select2
#'
#' Documentation: <https://blueprintjs.com/docs/#select/select2>
#'
#' @example inst/examples/Select.R
#' @inherit template params
#' @param items A list of options (containing `key`, `label` and `rightLabel` keys)
#' @export
Select2 <- SelectFactory("Select2")


#' Suggest
#'
#' Documentation: <https://blueprintjs.com/docs/#select/suggest>
#'
#' @example inst/examples/Suggest.R
#' @inherit template params
#' @param items A list of options (containing `key`, `label` and `rightLabel` keys)
#' @export
Suggest <- SelectFactory("Suggest")

#' Suggest2
#'
#' Documentation: <https://blueprintjs.com/docs/#select/suggest2>
#'
#' @example inst/examples/Suggest.R
#' @inherit template params
#' @param items A list of options (containing `key`, `label` and `rightLabel` keys)
#' @export
Suggest2 <- SelectFactory("Suggest2")

#' MultiSelect
#'
#' Documentation: <https://blueprintjs.com/docs/#select/multi-select>
#'
#' @example inst/examples/MultiSelect.R
#' @inherit template params
#' @param items A list of options (containing `key`, `label` and `rightLabel` keys)
#' @export
MultiSelect <- SelectFactory("MultiSelect")

#' MultiSelect2
#'
#' Documentation: <https://blueprintjs.com/docs/#select/multi-select2>
#'
#' @example inst/examples/MultiSelect.R
#' @inherit template params
#' @param items A list of options (containing `key`, `label` and `rightLabel` keys)
#' @export
MultiSelect2 <- SelectFactory("MultiSelect2")
