test_that("acro_rename_output without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_rename_output("output_0", "crosstab"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_rename_output works", {
  testthat::skip_on_cran()
  acro_init()
  table <- acro_crosstab(index = nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  acro_rename_output("output_0", "crosstab")
  acro_finalise("test", "json")
  # Check if the file exists in the specified folder
  expect_true(file.exists(file.path("..", "testthat", "test", "crosstab_0.csv")))
})

# Delete the test folder
unlink("test", recursive = TRUE)
