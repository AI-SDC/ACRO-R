lung <- lung[1:10, ]

test_that("acro_surv_func without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_surv_func(time=lung$time, status=lung$status), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_surv_func with output type table works", {
  testthat::skip_on_cran()
  acro_init()
  table = acro_surv_func(time=lung$time, status=lung$status, output ="table")
  expect_s3_class(table,"data.frame")
})

test_that("acro_surv_func with output type plot works", {
  testthat::skip_on_cran()
  acro_init()
  filename = acro_surv_func(time=lung$time, status=lung$status, output ="plot")
  expect_true(file.exists(filename[[2]]))
})

# Delete the acro_artifacts folder
unlink("acro_artifacts", recursive = TRUE)
