test_that("acro_enable_rounding without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_enable_suppression(), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_enable_rounding works", {
  testthat::skip_on_cran()
  acro_init()
  acro_enable_rounding()
  table <- acro_pivot_table(data = nursery_data, index = "parents", columns = "recommend", values = "children", aggfunc = "mean")
  output <- acro_print_outputs()
  status <- "review"
  exception <- "Rounding"
  expect_true(any(grepl(status, output)))
  expect_true(any(grepl(exception, output)))
})

test_that("acro_disable_rounding works", {
  testthat::skip_on_cran()
  acro_init()
  acro_disable_rounding()
  table <- acro_pivot_table(data = nursery_data, index = "parents", columns = "recommend", values = "children", aggfunc = "mean")
  output <- acro_print_outputs()
  status <- "fail"
  expect_true(any(grepl(status, output)))
})
