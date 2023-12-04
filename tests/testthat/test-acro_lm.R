nursery_data$recommend <- as.character(nursery_data$recommend)
nursery_data$recommend[which(nursery_data$recommend=="not_recom")] <- "0"
nursery_data$recommend[which(nursery_data$recommend=="recommend")] <- "1"
nursery_data$recommend[which(nursery_data$recommend=="very_recom")] <- "2"
nursery_data$recommend[which(nursery_data$recommend=="priority")] <- "3"
nursery_data$recommend[which(nursery_data$recommend=="spec_prior")] <- "4"
nursery_data$recommend <- as.numeric(nursery_data$recommend)

# extract relevant columns
df = nursery_data[, c("recommend", "children")]
# drop rows with missing values
df = df[complete.cases(df), ]
# formula to fit
formula = "recommend ~ children"

test_that("acro_lm without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_lm(formula=formula, data=df), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_lm works", {
  testthat::skip_on_cran()
  acro_init()
  model=acro_lm(formula=formula, data=df)
  expect_s3_class(model,"statsmodels.iolib.summary.Summary")
})

