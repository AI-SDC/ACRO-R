test_that("acro is installed in the correct enviroment", {
  # Specify a temporary environment for testing
  testthat::skip_on_cran()
  test_envname <- "test-acro-env"

  # Run the acro_init function
  acro_init(envname = test_envname)

  # Check if 'acro' is installed in the environment
  is_installed <- reticulate::py_module_available("acro")
  expect_true(is_installed)
})
