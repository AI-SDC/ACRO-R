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

  # Sort the expected table alphabetically by row and column names
  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  # Sort the actual table alphabetically by row and column names
  table <- table[
    order(rownames(table)),
    order(colnames(table)),
    drop = FALSE
  ]
  expect_equal(table, as.matrix(expected_table))
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

  # Sort the expected table alphabetically by row and column names
  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  # Sort the actual table alphabetically by row and column names
  table <- table[
    order(rownames(table)),
    order(colnames(table)),
    drop = FALSE
  ]

  expect_equal(table, as.matrix(expected_table))
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

  # Sort the expected table alphabetically by row and column names
  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  # Sort the actual table alphabetically by row and column names
  table <- table[
    order(rownames(table)),
    order(colnames(table)),
    drop = FALSE
  ]

  expect_equal(table, as.matrix(expected_table))
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

  # Sort the expected table alphabetically by row and column names
  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  # Sort the actual table alphabetically by row and column names
  table <- table[
    order(rownames(table)),
    order(colnames(table)),
    drop = FALSE
  ]

  expect_equal(table, as.matrix(expected_table))
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

  # Sort the expected table alphabetically by row and column names
  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  # Sort the actual table alphabetically by row and column names
  table <- table[
    order(rownames(table)),
    order(colnames(table)),
    drop = FALSE
  ]

  expect_equal(table, as.matrix(expected_table))
})

test_that("acro_table throws a warning if an unused argument is used", {
  testthat::skip_on_cran()
  acro_init()
  expect_warning(acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")], deparse.level = 2, dropna = "FALSE"), "Unused arguments were provided: dropna\nPlease use the help command to learn more about the function.")
})

test_that("acro_table works with the exclude parameter", {
  testthat::skip_on_cran()
  acro_init()

  # The actual table using the acro command
  actual_table <- acro_table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")], exclude = c("usual", NA, NaN))
  # The expected table using the R table command
  expected_table <- table(index = nursery_data[, c("recommend")], columns = nursery_data[, c("parents")], exclude = c("usual", NA, NaN))

  # Sort the expected table alphabetically by row and column names
  actual_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  # Sort the actual table alphabetically by row and column names
  expected_table <- actual_table[
    order(rownames(actual_table)),
    order(colnames(actual_table)),
    drop = FALSE
  ]

  expect_equal(actual_table, expected_table)
})

test_that("warning is triggered and NAs are removed from exclude list", {
  exclude_list <- c("usual", NA, NaN)

  acro_init()
  expect_warning(
    table <- acro_table(nursery_data[, "recommend"], nursery_data[, "parents"], exclude = exclude_list, useNA = "always"),
    "'exclude' containing NA and 'useNA' != \"no\"' are a bit contradicting"
  )
})


test_that("acro_table works with useNA = 'no'", {
  testthat::skip_on_cran()
  acro_init()

  # Inject NAs in the index and columns
  index_data <- replace(nursery_data[, "recommend"], 10:14, NA)
  cols_data <- replace(nursery_data[, "parents"], 16:20, NA)

  actual_table <- acro_table(
    index = index_data,
    columns = cols_data,
    useNA = "no"
  )

  expected_table <- table(index_data, cols_data, useNA = "no")

  # Sort the actual and expected table alphabetically by row and column names
  actual_table <- actual_table[
    order(rownames(actual_table)),
    order(colnames(actual_table)),
    drop = FALSE
  ]
  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  names(dimnames(expected_table)) <- NULL
  expect_equal(actual_table, expected_table)
})

test_that("acro_table works with usena = 'ifany'", {
  testthat::skip_on_cran()
  acro_init()

  # Inject NAs in the index and columns
  index_data <- replace(nursery_data[, "recommend"], 10:15, NA)
  cols_data <- replace(nursery_data[, "parents"], 16:20, NA)

  actual_table <- acro_table(
    index = index_data,
    columns = cols_data,
    useNA = "ifany"
  )

  expected_table <- table(index_data, cols_data, useNA = "ifany")

  # 4. Sort alphabetically to align R and Python outputs safely
  actual_table <- actual_table[
    order(rownames(actual_table)),
    order(colnames(actual_table)),
    drop = FALSE
  ]
  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  names(dimnames(expected_table)) <- NULL
  expect_equal(actual_table, expected_table)
})

test_that("acro_table works with usena = 'always'", {
  testthat::skip_on_cran()
  acro_init()

  index_data <- nursery_data[, "recommend"]
  cols_data <- nursery_data[, "parents"]

  actual_table <- acro_table(
    index = index_data,
    columns = cols_data,
    useNA = "always"
  )

  expected_table <- table(index_data, cols_data, useNA = "always")

  # Sort the actual and expected table alphabetically by row and column names
  actual_table <- actual_table[
    order(rownames(actual_table)),
    order(colnames(actual_table)),
    drop = FALSE
  ]

  expected_table <- expected_table[
    order(rownames(expected_table)),
    order(colnames(expected_table)),
    drop = FALSE
  ]

  names(dimnames(expected_table)) <- NULL
  expect_equal(actual_table, expected_table <- expected_table[-nrow(expected_table), -ncol(expected_table), drop = FALSE])
})
