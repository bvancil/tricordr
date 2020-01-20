test_data <- generate_tibble()

summary_data <- dplyr::count(test_data, x)

testthat::test_that('Constant xray mutation produces a tibble with constant output', {
  prov <- tricordr::Provenance$new()
  log <- prov$wrap_operations()
  output <- log$mutate(test_data, y = 0L * x)
  summary <- prov$summary(1)
  expected_summary <- dplyr::mutate(summary_data, y = 0L) %>%
    dplyr::select(x, y, n) %>%
    dplyr::arrange(x, y)
  testthat::expect_equal(summary, expected_summary)
})
