#' Fits Ordinary Least Squares Regression
#'
#' @param formula The formula specifying the model.
#' @param data The data for the model.
#'
#' @return Regression Results Wrapper.
#' @export
#'
#' @examples
#' acro_init()
#' # extract relevant columns
#' charity_data = charity_data[, c("inc_activity", "inc_grants")]
#' # drop rows with missing values
#' charity_data = charity_data[complete.cases(charity_data), ]
#' acro_lm(formula="inc_activity ~ inc_grants", data=charity_data)

acro_lm <- function(formula, data)
{
  "ACRO linear model"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
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
#' acro_init()
#' # extract relevant columns
#' df = charity_data[, c("survivor", "inc_activity", "inc_grants", "inc_donations", "total_costs")]
#' # drop rows with missing values
#' df = df[complete.cases(df), ]
#' # convert survivor to numeric
#' df = transform(df, survivor = as.numeric(survivor))
#' # formula to fit
#' formula = "survivor ~ inc_activity + inc_grants + inc_donations + total_costs"
#' acro_glm(formula=formula, data=df, family="logit")

acro_glm <- function(formula, data, family)
{
  "ACRO logit/probit model"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
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
