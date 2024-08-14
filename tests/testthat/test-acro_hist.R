test_that("acro_hist without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_hist(nursery_data, "children"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_hist works", {
  testthat::skip_on_cran()
  acro_init()
  filename = acro_hist(nursery_data, "children")
  expect_true(file.exists(filename))
})

# Delete the acro_artifacts folder
unlink("acro_artifacts", recursive = TRUE)
