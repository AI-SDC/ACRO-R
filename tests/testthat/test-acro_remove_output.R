test_that("acro_remove_output without initialising ACRO object first", {
  ac <<-NULL
  expect_error(acro_remove_output("output_1"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_remove_output works", {
  acro_init()
  table = acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  table = acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  acro_remove_output("output_1")
  acro_finalise("test", "json")
  expect_false(file.exists(file.path("..", "testthat", "test", "output_1")))
})
