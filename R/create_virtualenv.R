#' Install acro
#'
#' @param envname the name of the Python virtual environment
#' @param ... Any other parameters.
#' @param python_version Passed on to `reticulate::virtualenv_starter()`
#'
#' @return No return value, called for side effects

install_acro <- function(
    envname = "r-acro", ...,
    python_version = ">=3.8,<=3.11") {
  # create Python virtual environment
  reticulate::virtualenv_create(
    envname = envname,
    version = python_version,
    force = identical(envname, "r-acro"),
    packages = NULL
  )

  # install Python acro
  reticulate::py_install("acro", envname = envname)
}

#' Create a python virtual environment
#'
#' @param ... Any other parameters.
#'
#' @return No return value, called for side effects

create_virtualenv <- function(...) {
  # ensure a virtual environment exists
  if (!reticulate::virtualenv_exists("r-acro")) {
    install_acro()
  }

  # activate virtual environment
  reticulate::use_virtualenv("r-acro", required = TRUE)

  # ensure acro is installed
  if (!reticulate::py_module_available("acro")) {
    install_acro()
  }
}
