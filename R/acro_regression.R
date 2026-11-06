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

#' Fits a Cox proportional hazards regression model
#'
#' @param formula a formula object, with the response on the left of a ~ operator, and the terms on the right. The response must be a survival object as returned by the Surv function.
#' @param data a data.frame in which to interpret the variables named in the formula, or in the subset and the weights argument.
#' @param weights vector of case weights
#' @param subset expression indicating which subset of the rows of data should be used in the fit. All observations are included by default.
#' @param na.action a missing-data filter function.
#' @param robust should a robust variance be computed.
#' @param init vector of initial values of the iteration.
#' @param cluster optional variable which clusters the observations, for the purposes of a robust variance. If present, it implies robust. This variable will normally be found in data.
#' @param istate optional variable giving the current state at the start each interval.
#' @param statedata optional data set used to describe multistate models.
#' @param ... Any other parameters.
#'
#' @returns Fitted CoxPHFitter results object
#' @export

#' @importFrom stats na.omit terms model.frame

acro_coxph <- function(formula, data, weights = NULL, subset = NULL, na.action = NULL, robust = TRUE, init = NULL, cluster = NULL, istate = NULL, statedata = NULL, ...) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }

  # Check for multi-state model arguments (not supported by lifelines)
  if (!is.null(istate) || !is.null(statedata)) {
    stop("Multi-state models utilizing 'istate' or 'statedata' are not supported at the moment.")
  }

  model_data <- as.data.frame(data)

  weights_col <- NULL
  if (!missing(weights)) {
    res <- resolve_optional_column(substitute(weights), model_data, "weights", "acro_weight")
    weights_col <- res$col_name
    model_data <- res$data
  }

  # 4. Handle cluster using the helper function
  cluster_col <- NULL
  if (!missing(cluster)) {
    res <- resolve_optional_column(substitute(cluster), model_data, "cluster", "acro_cluster")
    cluster_col <- res$col_name
    model_data <- res$data
    robust <- TRUE # Clustering implies robust variance
  }

  # Handle subsetting if provided
  if (!missing(subset)) {
    subset_expr <- substitute(subset)
    subsetted_columns <- eval(subset_expr, model_data)
    model_data <- model_data[subsetted_columns & !is.na(subsetted_columns), ]
  }

  # Handle na.action
  if (is.null(na.action)) {
    na.action <- getOption("na.action")
  }

  na_function <- match.fun(na.action)
  model_data <- na_function(model_data)

  # Parse the formula to extract duration and event columns from the left-hand side
  surv_func <- formula[[2]]
  if (!inherits(surv_func, "call") || as.character(surv_func[[1]]) != "Surv") {
    stop("The left-hand side of the formula must use Surv(), e.g., Surv(time, event) ~ x1 + x2")
  }
  duration_col <- as.character(surv_func[[2]])
  event_col <- as.character(surv_func[[3]])

  # Validate and transform event column for python lifelines
  event_values <- unique(na.omit(model_data[[event_col]]))

  if (all(event_values %in% c(1, 2))) {
    model_data[[event_col]][model_data[[event_col]] == 1] <- 0
    model_data[[event_col]][model_data[[event_col]] == 2] <- 1
  } else if (!all(event_values %in% c(0, 1))) {
    # If it's neither {1, 2} nor {0, 1}, throw an error
    stop(paste0("In Surv(", duration_col, ", ", event_col, ") : Invalid status values"))
  }

  # Extract the right-hand side (independent variables) using terms()
  trm <- terms(formula, data = model_data)
  term_labels <- attr(trm, "term.labels")

  # Collapse back into a robust formula string
  independent_vars <- paste(term_labels, collapse = " + ")

  # Check for any unused arguments
  if (length(list(...)) > 0) {
    warning("Unsupported arguments were provided: ", paste0(names(list(...)), collapse = ", "), "\n", "Please use the help command to learn more about the function.")
  }

  model <- acroEnv$ac$coxph(
    df = model_data,
    duration_col = duration_col,
    event_col = event_col,
    weights_col = weights_col,
    robust = robust,
    formula = independent_vars,
    initial_point = init,
    cluster_col = cluster_col
  )

  return(model)
}
