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
  results <- dplyr::mutate(.data, ...)
  # Does this not exist anymore? Newly added, but it doesn't resurn what I expected.
  cols <- dplyr:::mutate_cols(.data, ...)
  input_col_names <- base::setdiff(c(), base::names(cols$add)) # TODO: Figure out how to parse
  truly_new_col_names <- base::setdiff(base::names(cols$add), base::names(.data))
  modified_col_names <- base::intersect(base::names(cols$add), base::names(.data))
  x_data <- .data[c(input_col_names, modified_col_names)]
  base::names(x_data) <- stringr::str_c('X_', base::names(x_data))
  y_data <- results[c(modified_col_names, truly_new_col_names)]
  base::names(y_data) <- stringr::str_c('Y_', base::names(y_data))
  xy_data <- base::cbind(x_data, y_data)
  process <- xy_data %>%
    dplyr::group_by_all() %>%
    dplyr::tally() %>%
    dplyr::ungroup()
  print(process)

  base::invisible(results)
}
