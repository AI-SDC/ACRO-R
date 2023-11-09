#' Fits Ordinary Least Squares Regression
#'
#' @param formula The formula specifying the model.
#' @param data The data for the model.
#'
#' @return Regression Results Wrapper.
#' @export
#'
#' @examples
#' # Convert the 'recommend' column to an integer scale
#' nursery_data$recommend <- as.character(nursery_data$recommend)
#' nursery_data$recommend[which(nursery_data$recommend=="not_recom")] <- "0"
#' nursery_data$recommend[which(nursery_data$recommend=="recommend")] <- "1"
#' nursery_data$recommend[which(nursery_data$recommend=="very_recom")] <- "2"
#' nursery_data$recommend[which(nursery_data$recommend=="priority")] <- "3"
#'nursery_data$recommend[which(nursery_data$recommend=="spec_prior")] <- "4"
#' nursery_data$recommend <- as.numeric(nursery_data$recommend)
#'
#' # extract relevant columns
#' df = nursery_data[, c("recommend", "children")]
#' # drop rows with missing values
#' df = df[complete.cases(df), ]
#' # formula to fit
#' formula = "recommend ~ children"
#' acro_init()
#' acro_lm(formula=formula, data=df)

acro_lm <- function(formula, data)
{
  "ACRO linear model"
  if (is.null(ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  model = ac$olsr(formula, data)
  model$summary()
}

#' Fits Logit or Probit model.
#'
#' @param formula The formula specifying the model.
#' @param data The data for the model.
#' @param family Decide whether to fit a logit or probit model.
#'
#' @return Regression Results Wrapper
#' @export
#'
#' @examples
#' # Convert the 'recommend' column to an integer scale
#' nursery_data$recommend <- as.character(nursery_data$recommend)
#' nursery_data$recommend[which(nursery_data$recommend=="not_recom")] <- "0"
#' nursery_data$recommend[which(nursery_data$recommend=="recommend")] <- "1"
#' nursery_data$recommend[which(nursery_data$recommend=="very_recom")] <- "2"
#' nursery_data$recommend[which(nursery_data$recommend=="priority")] <- "3"
#' nursery_data$recommend[which(nursery_data$recommend=="spec_prior")] <- "4"
#' nursery_data$recommend <- as.numeric(nursery_data$recommend)
#' # extract relevant columns
#' df = nursery_data[, c("finance", "children")]
#' # drop rows with missing values
#' df = df[complete.cases(df), ]
#' # convert finance to numeric
#' df = transform(df, finance = as.numeric(finance))
#' # subtract 1 to make 1s and 2S into 0a and 1s
#' df$finance <- df$finance -1
#' # formula to fit
#' formula = "finance ~ children"
#' acro_init()
#' acro_glm(formula=formula, data=df, family="probit")

acro_glm <- function(formula, data, family)
{
  "ACRO logit/probit model"
  if (is.null(ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  if (family == "logit") {
    model = ac$logitr(formula, data)
  } else if (family == "probit") {
    model = ac$probitr(formula, data)
  } else {
    stop("Invalid family. Options = {'logit', 'probit'}");
  }
  model$summary()
}
