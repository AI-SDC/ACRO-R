test_that("acro_pie without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_pie(nursery_data, "children"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_pie works", {
  testthat::skip_on_cran()
  acro_init()
  filename <- acro_pie(nursery_data, "children")
  expect_true(file.exists(filename))
})

test_that("acro_pie gives a warning on unused arguments", {
expect_warning(
    acro_pie(data = nursery_data, column = "children", fake_arg = 123),
    "Unused arguments were provided"
  )
})

test_that("acro_pie handles the border parameter", {
  result <- acro_pie(
    data = nursery_data,
    column = "children",
    border = "red",
  )

  expect_true(file.exists(result))
})

test_that("acro_pie handles the line (lty) parameter", {
  expect_silent(acro_pie(data = nursery_data, column = "children", lty = 0))
  expect_silent(acro_pie(data = nursery_data, column = "children", lty = "blank"))

  expect_silent(acro_pie(data = nursery_data, column = "children", lty = 2))
  expect_silent(acro_pie(data = nursery_data, column = "children", lty = "dashed"))

  # Test invalid numeric lty
  expect_warning(
    acro_pie(data = nursery_data, column = "children", lty = 99),
    "Unsupported line type"
  )

  # Test invalid string lty
  expect_warning(
    acro_pie(data = nursery_data, column = "children", lty = "invalid_style"),
    "Unsupported line type"
  )
})

# Delete the acro_artifacts folder
unlink("acro_artifacts", recursive = TRUE)
