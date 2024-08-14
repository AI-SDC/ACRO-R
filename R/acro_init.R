#' Initialise an ACRO object
#'
#' @param suppress Whether to automatically apply suppression.
#'
#' @return No return value, called for side effects
#' @export

acro_init <- function(suppress = FALSE) {
  create_virtualenv()
  acro <- reticulate::import("acro", delay_load = TRUE)
  acroEnv$ac <- acro$ACRO(suppress = suppress)
}
