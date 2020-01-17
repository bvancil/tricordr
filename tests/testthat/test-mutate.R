test_data <- generate_tibble()

summary_data <- dplyr::count(test_data, x)

testthat::test_that('Constant xray mutation produces a tibble with constant output', {
  logger <- list()
  output <- tricordr::mutate(test_data, y = 0L * x, .log = logger)
  summary <- logger[[1]]
  expected_summary <- dplyr::mutate(summary_data, y = 0L) %>%
    dplyr::select(x, y) %>%
    dplyr::count(x, y) %>%
    dplyr::arrange(x, y)
  testthat::expect_equal(summary, expected_summary)
})
