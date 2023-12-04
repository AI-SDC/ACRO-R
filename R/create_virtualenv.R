#' Install the python library 'acro'
#'
#' @param ... Any other parameters.
#' @param envname the name of the python virtual environment
#'
#' @return No return value, called for side effects

install_acro <- function(..., envname = "r-acro") {
  reticulate::py_install("acro", envname = envname, ...)
}

#' Create a python virtual environment
#'
#' @param ... Any other parameters.
#'
#' @return No return value, called for side effects

create_virtualenv <- function(...) {
  # Create a virtual environment if it does not exists
  if (!reticulate::virtualenv_exists("r-acro")) {
    reticulate::virtualenv_create("r-acro", version=">= 3.8")
  }
  reticulate::use_virtualenv("r-acro", required = TRUE)

  if (!reticulate::py_module_available("acro")) {
    install_acro()
  }
}
