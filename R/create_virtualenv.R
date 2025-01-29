acro_venv <- "r-acro-0.4.8"
acro_package <- "acro==0.4.8"
python_version <- ">=3.9"


#' Install acro
#'
#' @param envname the name of the Python virtual environment
#' @param ... Any other parameters.
#'
#' @return No return value, called for side effects

install_acro <- function(envname = "r-acro", ...) {
  # create Python virtual environment
  reticulate::virtualenv_create(
    envname = envname,
    version = python_version,
    force = TRUE,
    packages = NULL
  )

  # install Python acro
  reticulate::py_install(acro_package, envname = envname)
}

#' Create a python virtual environment
#'
#' @param ... Any other parameters.
#'
#' @return No return value, called for side effects

create_virtualenv <- function(...) {
  # ensure a virtual environment exists
  if (!reticulate::virtualenv_exists(acro_venv)) {
    install_acro(envname = acro_venv)
  }

  # activate virtual environment
  reticulate::use_virtualenv(acro_venv, required = TRUE)
}
