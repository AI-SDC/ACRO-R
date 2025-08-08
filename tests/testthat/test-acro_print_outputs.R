test_that("acro_print_outputs without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_print_outputs(), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_print_outputs works", {
  testthat::skip_on_cran()
  acro_init()
  table <- acro_crosstab(index = nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  output <- acro_print_outputs()
  output_uid <- "uid: output_0"
  expect_true(any(grepl(output_uid, output)))
})
