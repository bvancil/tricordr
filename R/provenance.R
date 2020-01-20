#' Provenance R6 class
#'
#' @return
#' @export
#'
#' @examples
Provenance <- R6::R6Class('Provenance',
  public = list(
    steps = NULL,

    initialize = function() {
      NULL
    },

    print = function() {
      str(self$steps)
    },

    length = function() {
      len(self$steps)
    },

    add_step = function(x) {
      self$steps <- c(self$steps, x)
    },

    rollback_last = function() {
      self$drop(self$length())
    },

    drop = function(index) {
      self$steps <- self$steps[-index]
    },

    summary = function(index) {
      self$steps[[index]]$summary
    },

    wrap_operations = function() {
      list(
        mutate = private$wrap(dplyr::mutate, xray),
        generic = function(operation_func) {
          private$wrap(operation_func, xray)
        }
      )
    }
  ),
  private = list(
    wrap = function(operation_func, metadata_func) {
      function(.data, ...) {
        return_data <- operation_func(.data, ...)
        step <- metadata_func(.data, ...)
        self$add_step(step)
        return_data
      }
    }
  )
)
