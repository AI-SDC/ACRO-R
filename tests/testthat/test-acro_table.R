test_that("acro_table without initialising ACRO object first", {
  ac <<-NULL
  expect_error(acro_table(index=nursery_data[, c("recommend")], columns = nursery_data[, c("parents")]), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_table works", {
  # Creating the dataframe
  expected_table <- data.frame(
    great_pret = c(1440, 858, 0, 2022, 0),
    pretentious = c(1440, 1484, 0, 1264, 132),
    usual = c(1440, 1924, 2, 758, 196)
  )

  # Adding row names
  rownames(expected_table) <- c("not_recom", "priority", "recommend", "spec_prior", "very_recom")

  acro_init()
  table = acro_table(index=nursery_data[, c("recommend")], columns = nursery_data[, c("parents")])
  print(table)

  expect_equal(table[, -1, drop = FALSE], expected_table[, -1, drop = FALSE])
})
