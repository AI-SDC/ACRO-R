test_that("acro_pivot_table without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_pivot_table(data = nursery_data, index = "parents", values = "children", aggfunc = list("mean", "std")), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_pivot_table works", {
  testthat::skip_on_cran()
  expected_table <- data.frame(
#    "(mean', 'children')" = c(3.272222, 3.242593, 3.241667),
#    "('std', 'children')" = c(2.48458394, 2.43848908, 2.42963966),
    "mean children" = c(3.272222, 3.242593, 3.241667),
    "std   children" = c(2.48458394, 2.43848908, 2.42963966),
    check.names = FALSE
  )

  # Adding row names to match the provided output
  rownames(expected_table) <- c(1, 2, 3)
  rownames(expected_table) <- as.integer(rownames(expected_table))

  acro_init()
  table <- acro_pivot_table(data = nursery_data, index = "parents", values = "children", aggfunc = list("mean", "std"))
  print( table)
  print(expected_table)
  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})
