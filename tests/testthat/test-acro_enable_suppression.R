test_that("acro_enable_suppression without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_enable_suppression()(), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_enable_suppression works", {
  testthat::skip_on_cran()
  acro_init()
  acro_enable_suppression()
  table <- acro_crosstab(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")])
  output <- acro_print_outputs()
  status <- "review"
  expect_true(any(grepl(status, output)))
})
