#' Mutate using X-rays
#'
#' @param .data tibble
#' @param ... arguments to dplyr::mutate
#' @param .log logging object
#'
#' @return tibble
#' @export
#'
#' @examples
#' xray(dplyr::starwars, mass = base::round(mass, -1))
xray <- function(.data, ..., .log = NULL) {
  # TODO: Add variables used in count as well
  # TODO: Figure out what to do with .log
  process <- .data %>%
    dplyr::count(...)
  print(process)

  .data %>%
    dplyr::mutate(...) %>%
    base::invisible()
}
