test_that("acro_crosstab without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")]), "ACRO has not been initialised. Please first call acro_init()")
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
  table = acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})
