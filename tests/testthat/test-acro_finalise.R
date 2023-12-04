test_that("acro_finalise without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_finalise("test", "json"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_finalise works", {
  testthat::skip_on_cran()
  acro_init()
  table = acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  acro_finalise("test", "json")
  expect_true(dir.exists("test"))
})

# Delete the test folder
unlink("test", recursive = TRUE)
