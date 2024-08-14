test_that("acro_table without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")]), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_table works", {
  testthat::skip_on_cran()
  # Creating the dataframe
  expected_table <- data.frame(
    great_pret = c(1440, 858, 0, 2022, 0),
    pretentious = c(1440, 1484, 0, 1264, 132),
    usual = c(1440, 1924, 2, 758, 196)
  )

  # Adding row names
  rownames(expected_table) <- c("not_recom", "priority", "recommend", "spec_prior", "very_recom")

  acro_init()
  table <- acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")])

  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})

test_that("acro_table works with dnn", {
  # Creating the dataframe
  testthat::skip_on_cran()
  expected_table <- data.frame(
    great_pret = c(1440, 858, 0, 2022, 0),
    pretentious = c(1440, 1484, 0, 1264, 132),
    usual = c(1440, 1924, 2, 758, 196)
  )

  # Adding row names
  rownames(expected_table) <- c("not_recom", "priority", "recommend", "spec_prior", "very_recom")

  acro_init()
  table <- acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")], dnn = c("recommend", "parents"))
  print(table)

  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})

test_that("acro_table works with deparse.level is one", {
  # Creating the dataframe
  testthat::skip_on_cran()
  expected_table <- data.frame(
    great_pret = c(1440, 858, 0, 2022, 0),
    pretentious = c(1440, 1484, 0, 1264, 132),
    usual = c(1440, 1924, 2, 758, 196)
  )

  # Adding row names
  rownames(expected_table) <- c("not_recom", "priority", "recommend", "spec_prior", "very_recom")

  acro_init()
  table <- acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")], deparse.level = 1)

  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})

test_that("acro_table works with deparse.level is one", {
  # Creating the dataframe
  testthat::skip_on_cran()
  expected_table <- data.frame(
    great_pret = c(1440, 858, 0, 2022, 0),
    pretentious = c(1440, 1484, 0, 1264, 132),
    usual = c(1440, 1924, 2, 758, 196)
  )

  # Adding row names
  rownames(expected_table) <- c("not_recom", "priority", "recommend", "spec_prior", "very_recom")

  acro_init()
  index <- nursery_data[, c("recommend")]
  columns <- nursery_data[, c("parents")]
  table <- acro_table(index = index, columns = columns, deparse.level = 1)

  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})

test_that("acro_table works with deparse.level is two", {
  # Creating the dataframe
  testthat::skip_on_cran()
  expected_table <- data.frame(
    great_pret = c(1440, 858, 0, 2022, 0),
    pretentious = c(1440, 1484, 0, 1264, 132),
    usual = c(1440, 1924, 2, 758, 196)
  )

  # Adding row names
  rownames(expected_table) <- c("not_recom", "priority", "recommend", "spec_prior", "very_recom")

  acro_init()
  table <- acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")], deparse.level = 2)

  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})

test_that("acro_table throws a warning if an unused argument is used", {
  testthat::skip_on_cran()
  acro_init()
  expect_warning(acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")], deparse.level = 2, useNA = "always"), "Unused arguments were provided: useNA\nPlease use the help command to learn more about the function.")
})
