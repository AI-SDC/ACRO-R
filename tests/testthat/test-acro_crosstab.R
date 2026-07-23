test_that("acro_crosstab without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_crosstab(index = nursery_data[, c("health")], columns = nursery_data[, c("finance")]), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_crosstab works", {
  # Creating the data frame with the specified values and row names
  testthat::skip_on_cran()
  expected_table <- data.frame(
    convenient = c(2160, 2160, 2160),
    inconv = c(2160, 2160, 2160)
  )

  # Assigning row names to the data frame
  row.names(expected_table) <- c("not_recom", "priority", "recommended")

  acro_init()
  table <- acro_crosstab(index = nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})

test_that("acro_crosstab works with margins", {
  acro_init()
  p_table <- acro_crosstab(index = nursery_data[, c("health")], columns = nursery_data[, c("finance")], margins = TRUE)

  # Create an R table with margins
  r_table <- addmargins(table(nursery_data[, c("health")], columns = nursery_data[, c("finance")]))

  expect_equal(unname(as.matrix(r_table)), unname(as.matrix(p_table)))
})

test_that("acro_crosstab works with aggregation function", {
  # Creating the data frame with the specified values and row names
  testthat::skip_on_cran()
  expected_table <- data.frame(
    convenient = c(3.25, 3.23, 3.25),
    inconv = c(3.26, 3.26, 3.24)
  )

  # Assigning row names to the data frame
  row.names(expected_table) <- c("not_recom", "priority", "recommended")

  acro_init()
  table <- acro_crosstab(index = nursery_data[, c("health")], columns = nursery_data[, c("finance")], values = nursery_data[, c("children")], aggfunc = "mean")
  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE], tolerance = 0.01)
})

test_that("acro_crosstab throws an error for unsupported aggregation functions", {
  acro_init()
  expect_error(
    acro_crosstab(
      index = nursery_data$health,
      columns = nursery_data$finance,
      values = nursery_data$children,
      aggfunc = "max"
    ),
    "Unsupported aggregation function provided"
  )
})

test_that("acro_crosstab throws an error for missing values", {
  acro_init()
  expect_error(
    acro_crosstab(
      index = nursery_data$health,
      columns = nursery_data$finance,
      aggfunc = "mean"
    ),
    "If you pass an aggregation function to crosstab"
  )
})
