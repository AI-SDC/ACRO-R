#' Fits Ordinary Least Squares Regression
#'
#' @param formula The formula specifying the model.
#' @param data The data for the model.
#'
#' @return Regression Results Wrapper.
#' @export

acro_lm <- function(formula, data) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  model <- acroEnv$ac$olsr(formula, data)
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

acro_glm <- function(formula, data, family) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  if (family == "logit") {
    model <- acroEnv$ac$logitr(formula, data)
  } else if (family == "probit") {
    model <- acroEnv$ac$probitr(formula, data)
  } else {
    stop("Invalid family. Options for family are: logit or probit")
  }
  model$summary()
}
