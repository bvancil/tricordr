# See http://adv-r.had.co.nz/Expressions.html#ast-funs

symbols_from_ast <- function(expr) {

  rlang::expr_name(expr)
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
xray <- function(.data, ..., .summarize = TRUE) {
  dots <- rlang::enquos(...)
  dots_names <- base::names(dots)
  auto_named_dots <- base::names(rlang::enquos(..., .named = TRUE))
  if (length(dots) == 0L) {
    return(NULL)
  }
  input_output_list <- purrr::map2(dots, auto_named_dots, function(input_quo, output) {
    # browser()
    transformation <- rlang::as_label(input_quo)
    input_expr <- rlang::quo_get_expr(input_quo)
    input <- symbols_from_ast(input_expr)
    list(
      input = input,
      output = output,
      transformation = transformation,
      summary = NULL
    )
  }) %>%
    rlang::set_names(NULL)
  input_output_list
}

