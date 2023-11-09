test_that("acro_custom_output without initialising ACRO object first", {
  ac <<-NULL
  expect_error(acro_custom_output(filepath), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_custom_output works", {
  acro_init()
  acro_custom_output("XandY.jpeg")
  acro_add_exception("output_0", "This image is not disclosive")
  acro_finalise("test", "json")
  expect_true(file.exists(file.path("..", "testthat", "test", "XandY.jpeg")))
})
