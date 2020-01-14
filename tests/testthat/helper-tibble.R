generate_tibble <- function(size = 100L, values = base::seq.int(10)) {
  tibble::tibble(x = base::sample(values, size, replace = TRUE))
}
