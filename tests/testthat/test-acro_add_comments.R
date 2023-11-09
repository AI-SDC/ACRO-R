test_that("acro_add_comments without initialising ACRO object first", {
  ac <<- NULL
  expect_error(acro_add_comments("output_0", "This is a crosstab"), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_add_comments works", {
  acro_init()
  table = acro_crosstab(index=nursery_data[, c("health")], columns = nursery_data[, c("finance")])
  comment = "This is a crosstab"
  acro_add_comments("output_0", comment)
  acro_finalise("test", "json")

  # Read the file content
  file_content=readLines(file.path("..", "testthat", "test", "results.json"))
  # Check the comment exists in the results
  expect_true(any(grepl(comment, file_content)))
})
