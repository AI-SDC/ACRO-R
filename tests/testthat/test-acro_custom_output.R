test_that("acro_custom_output without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_custom_output(filepath), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_custom_output works", {
  testthat::skip_on_cran()
  acro_init()
  acro_custom_output("XandY.jpeg")
  acro_add_exception("output_0", "This image is not disclosive")
  acro_finalise("test", "json")
  expect_true(file.exists(file.path("..", "testthat", "test", "XandY.jpeg")))
})

# Delete the test folder
unlink("test", recursive = TRUE)
