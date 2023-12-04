test_that("install_acro installs 'acro' in the specified environment", {
  # Specify a temporary environment for testing
  testthat::skip_on_cran()
  test_envname <- "test-acro-env"

  # Run the install_acro function
  install_acro(envname = test_envname)

  # Check if 'acro' is installed in the test environment
  is_installed <- reticulate::py_module_available("acro")
  expect_true(is_installed)

  # remove the temporary environment
  reticulate::virtualenv_remove(test_envname, confirm = FALSE)
})
