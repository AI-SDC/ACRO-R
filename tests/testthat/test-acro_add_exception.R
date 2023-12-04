test_that("acro_add_exception without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_add_exception("output_0", "The disclosive cells are structural zeros and not actually disclosive"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("add_exceptions works", {
  testthat::skip_on_cran()
  acro_init()
  table = acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  acro_add_exception("output_0", "The disclosive cells are structural zeros and not actually disclosive")
  acro_finalise("test", "json")

  # Read the file content
  file_content=readLines(file.path("..", "testthat", "test", "results.json"))
  # Check the exception exists in the results
  expect_true(any(grepl("The disclosive cells are structural zeros and not actually disclosive", file_content)))
})

# Delete the test folder
unlink("test", recursive = TRUE)
