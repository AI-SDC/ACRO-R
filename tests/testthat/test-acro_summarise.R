test_that("acro_summarise works with one grouping parameter", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children), .by = recommend) |>
    dplyr::arrange(recommend)

  # table produces by acro_summarise function
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), .by = recommend) |>
    dplyr::arrange(recommend)

  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})

test_that("acro_summarise works with two grouping parameters", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children), .by = c(parents, recommend)) |>
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), .by = c(parents, recommend)) |>
    dplyr::arrange(parents, recommend)

  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})

test_that("acro_summarise works with no grouping parameter calculate the summary function for the whole dataset", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children))

  # table produces by acro_summarise function
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children))

  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})


test_that("acro_summarise works with two summary functions for the same variable", {
  # table produces by summarise function from dplyr package
  R_table <- dplyr::summarise(nursery_data, mean_children = mean(children), sd_children = sd(children), .by = recommend) |>
    dplyr::arrange(recommend)


  # table produces by acro_summarise function
  acro_table <- acro_summarise(nursery_data, mean_children = mean(children), sd_children = sd(children), .by = recommend) |>
    dplyr::arrange(recommend)


  expect_equal(acro_table, R_table, tolerance = 1e-5, ignore_attr = TRUE)
})

test_that("acro_summarise works with piping", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), sd_children = sd(children)) %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
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
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), .groups = "keep") %>%
    dplyr::arrange(parents, recommend)

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
})

test_that("acro_summarise works with .groups = rowwise", {
  # table produces by summarise function from dplyr package
  R_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    dplyr::summarise(mean_children = mean(children), .groups = "rowwise") %>%
    dplyr::arrange(parents, recommend)

  # table produces by acro_summarise function
  acro_table <- nursery_data %>%
    dplyr::group_by(parents, recommend) %>%
    acro_summarise(mean_children = mean(children), .groups = "rowwise") %>%
    dplyr::arrange(parents, recommend)

  expect_equal(dplyr::group_vars(R_table), dplyr::group_vars(acro_table))
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
