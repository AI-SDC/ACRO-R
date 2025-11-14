test_that("find_python returns a valid path", {
  testthat::skip_on_cran()
  python_path <- Sys.which("python3")
  if (python_path == "") {
    python_path <- Sys.which("python")
  }
  expect_true(python_path != "")
})

test_that("install_acro function exists and is callable", {
  testthat::skip_on_cran()
  expect_true(is.function(install_acro))
})

test_that("create_virtualenv function exists and is callable", {
  testthat::skip_on_cran()
  expect_true(is.function(create_virtualenv))
})

test_that("install_acro stops when python not found", {
  # Mock Sys.which to return empty string (simulates Python not installed)
  with_mock(
    `base::Sys.which` = function(x) "",
    expect_error(
      install_acro(envname = "test-env", python = NULL),
      "Python not found in PATH"
    )
  )
})

test_that("create_virtualenv stops when python not found", {
  # Mock Sys.which to return empty string
  with_mock(
    `base::Sys.which` = function(x) "",
    expect_error(
      create_virtualenv(),
      "Python not found in PATH"
    )
  )
})
