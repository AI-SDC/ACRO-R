test_that("acro is installed in the virtual environment", {
  testthat::skip_on_cran()
  test_envname <- "test-acro-env"

  # Run the acro_init function
  acro_init(envname = test_envname)

  # Check if 'acro' is installed in the correct environment
  is_installed <- reticulate::py_module_available("acro")
  expect_true(is_installed)
})