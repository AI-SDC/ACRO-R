test_that("acro_init initialises the ACRO object", {
  testthat::skip_on_cran()
  acro_init()

  # Check if the ac object is created and has the correct class
  expect_true(exists("ac", envir = acroEnv))
  expect_s3_class(acroEnv$ac, "acro.acro.ACRO")
})
