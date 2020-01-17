# See http://adv-r.had.co.nz/Expressions.html#ast-funs

symbols_from_ast <- function(expr) {

}

#' Inspect using X-rays
#'
#' @param .data tibble that is not used (but is here to match signature of mutate)
#' @param ... arguments akin to dplyr::mutate
#'
#' @return list of lists of input and output
#' @export
#'
#' @examples
#' xray(dplyr::starwars, mass = base::round(mass, -1))
xray <- function(.data, ..., .log = NULL) {
  dots <- rlang::enquos(...)
  dots_names <- base::names(dots)
  auto_named_dots <- base::names(rlang::enquos(..., .named = TRUE))
  if (length(dots) == 0L) {
    return(NULL)
  }
  output <- auto_named_dots
  input <- NULL
  browser()
}
