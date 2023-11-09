test_that("acro_rename_output without initialising ACRO object first", {
  ac <<-NULL
  expect_error(acro_rename_output("output_0", "crosstab"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_rename_output works", {
  acro_init()
  table = acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  acro_rename_output("output_0", "crosstab")
  acro_finalise("test", "json")
  # Check if the file exists in the specified folder
  expect_true(file.exists(file.path("..", "testthat", "test", "crosstab_0.csv")))
})
