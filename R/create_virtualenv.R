acro_venv <- "r-acro"
acro_package <- "acro==0.4.11"
python_version <- ">=3.10"

#' Install acro
#'
#' @param envname the name of the Python virtual environment
#' @param python the path to Python executable
#' @param ... Any other parameters.
#'
#' @return No return value, called for side effects
install_acro <- function(envname = "r-acro", python = NULL, ...) {
  # Get Python executable if not provided
  if (is.null(python)) {
    python <- Sys.which("python3")
    if (python == "") {
      python <- Sys.which("python") # nocov
      if (python == "") { # nocov
        stop("Python not found in PATH. Please ensure Python is installed and accessible.") # nocov
      } # nocov
    }
  }
  
  # create Python virtual environment
  reticulate::virtualenv_create(
    envname = envname,
    python = python,
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
  # Get Python executable path
  python_path <- Sys.which("python3")
  if (python_path == "") {
    python_path <- Sys.which("python") # nocov
  }
  
  # ensure a virtual environment exists
  if (!reticulate::virtualenv_exists(acro_venv)) {
    install_acro(envname = acro_venv, python = python_path)
  }
  
  # activate virtual environment
  reticulate::use_virtualenv(acro_venv, required = TRUE)
}
