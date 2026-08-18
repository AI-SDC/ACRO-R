test_that("acro_hist without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_hist(nursery_data, "children"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_hist works", {
  testthat::skip_on_cran()
  acro_init()
  filename <- acro_hist(nursery_data, "children")
  expect_true(file.exists(filename))
})

# Delete the acro_artifacts folder
unlink("acro_artifacts", recursive = TRUE)

test_that("Python and R counts mismatch when using raw breaks (proving why the offset is needed)", {
  # Define test data containing exact boundary values
  test_df <- data.frame(hours = c(0, 5, 10, 10, 15, 20, 20, 25, 30, 40))

  # R histograms
  r_hist <- hist(test_df$hours, breaks = 5, plot = FALSE)
  r_counts <- r_hist$counts
  r_breaks <- r_hist$breaks

  # Run NumPy histogram using the r breaks
  np <- reticulate::import("numpy")
  py_hist <- np$histogram(test_df$hours, bins = r_breaks)
  py_counts <- py_hist[[1]]

  # Assert that without the offset, the NumPy histogram counts and R counts don't match
  expect_false(identical(as.numeric(py_counts), as.numeric(r_counts)))
})

test_that("NumPy histogram counts match R counts when using the offset breaks", {
  # Define test data containing exact boundary values
  test_df <- data.frame(hours = c(0, 5, 10, 10, 15, 20, 20, 25, 30, 40))

  # R histogram
  r_hist <- hist(test_df$hours, breaks = 5, plot = FALSE)
  R_counts <- r_hist$counts
  R_breaks <- r_hist$breaks

  # Create the offset breaks and use it in numpy histogram to get the counts and bins
  offest_breaks <- get_offset_hist_breaks(test_df, "hours", breaks = 5)

  np <- reticulate::import("numpy")
  py_result <- np$histogram(test_df$hours, bins = offest_breaks)
  py_counts <- py_result[[1]]

  # Assert that Python's counts match Base R's counts
  expect_equal(as.numeric(py_counts), as.numeric(R_counts))
})

test_that("NumPy histogram counts match R counts with offset breaks using float data", {
  # Define a test data frame with floating-point values, including exact boundaries
  test_df <- data.frame(hours = c(1.5, 5.2, 10.0, 12.4, 15.8, 20.0, 22.1, 27.5, 30.0, 38.6))

  # R histogram
  r_hist <- hist(test_df$hours, breaks = 4, plot = FALSE)
  r_counts <- r_hist$counts

  # Create the offset breaks and use it in numpy histogram to get the counts and bins
  offset_breaks <- get_offset_hist_breaks(test_df, "hours", breaks = 4)

  np <- reticulate::import("numpy")
  py_result <- np$histogram(test_df$hours, bins = offset_breaks)
  py_counts <- py_result[[1]]

  # Assert that Python's counts match R's counts
  expect_equal(as.numeric(py_counts), as.numeric(r_counts))
})

test_that("NumPy histogram counts match R counts with offset breaks when breaks are the default (sturges)", {
  # Define a test data frame with floating-point values, including exact boundaries
  test_df <- data.frame(hours = c(1.5, 5.2, 10.0, 12.4, 15.8, 20.0, 22.1, 27.5, 30.0, 38.6))

  # R histogram
  r_hist <- hist(test_df$hours, plot = FALSE)
  r_counts <- r_hist$counts

  # Create the offset breaks and use it in numpy histogram to get the counts and bins
  offset_breaks <- get_offset_hist_breaks(test_df, "hours")

  np <- reticulate::import("numpy")
  py_result <- np$histogram(test_df$hours, bins = offset_breaks)
  py_counts <- py_result[[1]]

  # Assert that Python's counts match R's counts
  expect_equal(as.numeric(py_counts), as.numeric(r_counts))
})
