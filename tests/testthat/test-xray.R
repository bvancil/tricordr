test_data <- generate_tibble()

summary_data <- dplyr::count(test_data, x)

testthat::test_that('xray can find input and output arguments', {
  expected_summary <- glue::glue
  testthat::expect_equal(
    tricordr::xray(test_data, y = 0L * x),
    list(
      list(
        input = c('x'),
        output = 'y',
        transformation = '0L * x'
      )
    )
  )
})
