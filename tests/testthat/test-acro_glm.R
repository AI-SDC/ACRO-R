nursery_data$recommend <- as.character(nursery_data$recommend)
nursery_data$recommend[which(nursery_data$recommend == "not_recom")] <- "0"
nursery_data$recommend[which(nursery_data$recommend == "recommend")] <- "1"
nursery_data$recommend[which(nursery_data$recommend == "very_recom")] <- "2"
nursery_data$recommend[which(nursery_data$recommend == "priority")] <- "3"
nursery_data$recommend[which(nursery_data$recommend == "spec_prior")] <- "4"
nursery_data$recommend <- as.numeric(nursery_data$recommend)
# extract relevant columns
df <- nursery_data[, c("finance", "children")]
# drop rows with missing values
df <- df[complete.cases(df), ]
# convert finance to numeric
df <- transform(df, finance = as.numeric(finance))
# subtract 1 to make 1s and 2S into 0a and 1s
df$finance <- df$finance - 1
# formula to fit
formula <- "finance ~ children"
test_that("acro_glm without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_glm(formula = formula, data = df, family = "probit"), "ACRO has not been initialised. Please first call acro_init()")
})
test_that("acro_glm with probit as a family works", {
  testthat::skip_on_cran()
  acro_init()
  model <- acro_glm(formula = formula, data = df, family = "probit")
  expect_s3_class(model, "statsmodels.iolib.summary.Summary")
})
test_that("acro_glm with logit as a family works", {
  testthat::skip_on_cran()
  acro_init()
  model <- acro_glm(formula = formula, data = df, family = "logit")
  expect_s3_class(model, "statsmodels.iolib.summary.Summary")
})
test_that("acro_glm through an error if the family is not recognised", {
  testthat::skip_on_cran()
  acro_init()
  expect_error(acro_glm(formula = formula, data = df, family = "mean"), "Invalid family. Options for family are: logit or probit")
})
