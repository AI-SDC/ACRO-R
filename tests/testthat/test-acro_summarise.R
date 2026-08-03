test_that("acro_summarise throws an error if the ACRO object was not initialised first", {
  acroEnv$ac <- NULL
  expect_error(acro_summarise(acro_summarise(nursery_data, mean_children = mean(children), .by = recommend)), "ACRO has not been initialised. Please first call acro_init()")
})


test_that("acro_summarise works with one grouping parameter", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children), .by = recommend) |>
    dplyr::arrange(recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), .by = recommend) |>
    dplyr::arrange(recommend)

  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})

test_that("acro_summarise works with two grouping parameters", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children), .by = c(parents, recommend)) |>
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), .by = c(parents, recommend)) |>
    dplyr::arrange(parents, recommend)

  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})

test_that("acro_summarise works with no grouping parameter calculate the summary function for the whole dataset", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children))

  # table produces by acro_summarise function
  acro_init()
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children))

  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})


test_that("acro_summarise works with two summary functions for the same variable", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children), sd_children = sd(children), .by = recommend) |>
    dplyr::arrange(recommend)


  # table produces by acro_summarise function
  acro_init()
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), sd_children = sd(children), .by = recommend) |>
    dplyr::arrange(recommend)


  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})

test_that("acro_summarise throws an error when different aggreagtion functions used for different values", {
  acro_init()
  expect_error(acro_summarise(nursery_data, mean_children = mean(children), sd_parents = sd(parents), .by = recommend), "ACRO currently does not support different aggregation functions for different values.")
})

test_that("acro_summarise works with piping", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), sd_children = sd(children)) %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), sd_children = sd(children)) %>%
    dplyr::arrange(parents, recommend)


  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})

test_that("acro_summarise works with .groups = drop_last", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), .groups = "drop_last") %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), .groups = "drop_last") %>%
    dplyr::arrange(parents, recommend)

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise works with .groups = drop", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), .groups = "drop") %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), .groups = "drop") %>%
    dplyr::arrange(parents, recommend)

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise works with .groups = drop", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), .groups = "drop") %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), .groups = "drop") %>%
    dplyr::arrange(parents, recommend)

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise works with .groups = keep", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), .groups = "keep") %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), .groups = "keep") %>%
    dplyr::arrange(parents, recommend)

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise works with .groups = keep when there is no grouping provided", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::summarise(mean_children = mean(children), .groups = "keep")

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    acro_summarise(mean_children = mean(children), .groups = "keep")

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise works with .groups = rowwise when there is no grouping provided", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::summarise(mean_children = mean(children), .groups = "rowwise")

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    acro_summarise(mean_children = mean(children), .groups = "rowwise")

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise works with .groups = rowwise", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), .groups = "rowwise") %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_init()
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), .groups = "rowwise") %>%
    dplyr::arrange(parents, recommend)

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise throws an error with .groups is assigned to a not valid option", {
  acro_init()
  expect_error(
    nursery_data %>%
      dplyr::group_by(parents, recommend) %>%
      acro_summarise(mean_children = mean(children), .groups = "columns"),
    "`.groups` must be one of 'drop', 'drop_last', 'keep', or 'rowwise'."
  )
})

test_that("acro_summarise gives error when both .by and .groups are provided", {
  expect_error(
    nursery_data %>%
      acro_summarise(mean_children = mean(children), .by = parents, .groups = "drop"),
    "Can't supply both `\\.by` and `\\.groups`\\."
  )
})

test_that("acro_summarise gives error when .by is provided on a grouped dataframe", {
  expect_error(
    nursery_data %>%
      dplyr::group_by(recommend) %>%
      acro_summarise(mean_children = mean(children), .by = parents),
    "Can't supply `\\.by` when `\\.data` is a grouped data frame\\."
  )
})

test_that("acro_summarise gives error when aggregation function is n()", {
  expect_error(
    nursery_data %>%
      dplyr::group_by(recommend) %>%
      acro_summarise(count_children = n()),
    "Function n is not supported, but it will be available soon. Please use: mean, median, mode, sd or sum."
  )
})

test_that("acro_summarise gives error when aggregation function is not provided", {
  expect_error(
    nursery_data %>%
      dplyr::group_by(recommend) %>%
      acro_summarise(max_children = max()),
    "Function max is not supported. Please use: mean, median, mode, sd or sum."
  )
})

test_that("acro_summarise returns the status of the SDC checks as pass when the output is safe", {
  acro_init()
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), .by = parents)

  # Access the python results object
  py_results <- acro:::acroEnv$ac$results
  output <- py_results$get_index(as.integer(0))

  # Verify status matches expected SDC risk assessment
  correct_status <- "pass"
  expect_equal(as.character(output$status), correct_status)
})

test_that("acro_summarise returns the status of the SDC checks as fail when the output is unsafe", {
  acro_init()
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), .by = c(parents, recommend))

  # Access the python results object
  py_results <- acro:::acroEnv$ac$results
  output <- py_results$get_index(as.integer(0))

  # Verify status matches expected SDC risk assessment
  correct_status <- "fail"
  expect_equal(as.character(output$status), correct_status)
})

test_that("acro_summarise returns the summary as review when suppression is enabled", {
  acro_init()
  acro_enable_suppression()
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), .by = c(parents, recommend))

  # Access the python results object
  py_results <- acro:::acroEnv$ac$results
  output <- py_results$get_index(as.integer(0))

  # Verify status matches expected SDC risk assessment
  correct_status <- "review"
  correct_exception <- "Suppression automatically applied where needed"
  expect_equal(as.character(output$status), correct_status)
  expect_equal(as.character(output$exception), correct_exception)
})
