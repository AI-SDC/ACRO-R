# Globals -----------------------------------------------------------------
acro_venv <- "r-acro"
acro_pkg <- "acro==0.4.11"
ch <- "conda-forge"


#' Resolve Python executable
#'
#' @return String path to a Python executable.
## nocov start
get_python <- function() {
  python <- Sys.which("python3")
  if (python == "") {
    python <- Sys.which("python")
    if (python == "") {
      stop("Python not found in PATH. Please ensure Python is installed.")
    }
  }
  return(python)
}
## nocov end


#' Install ACRO in a conda environment
#'
#' @param envname Name of the conda environment
## nocov start
install_conda <- function(envname) { # nocov
  if (!reticulate::condaenv_exists(envname = envname, conda = "auto")) {
    reticulate::conda_create(envname = envname, python_version = "3.12", channel = ch)
    reticulate::conda_install(envname = envname, packages = acro_pkg, channel = ch)
  }
}
## nocov end


#' Initialise ACRO in a Python virtual environment
#'
#' @param envname Name of the virtual environment
install_venv <- function(envname = acro_venv) {
  if (!reticulate::virtualenv_exists(envname)) {
    python <- get_python()

    reticulate::virtualenv_create(
      envname = envname,
      python = python,
      force = TRUE,
      packages = NULL
    )

    reticulate::py_install(acro_pkg, envname = envname)
  }
}


#' Initialise an ACRO object
#'
#' @param suppress Whether to automatically apply suppression.
#' @param envname Name of the Python environment to use.
#' @param use_conda Whether to use a Conda environment (`TRUE`) or venv (`FALSE`).
#'
#' @return Invisibly returns the ACRO object, which is used internally.
#' @export
acro_init <- function(suppress = FALSE, envname = acro_venv, use_conda = FALSE) {
  # initialise the environment
  if (!reticulate::py_available(initialize = FALSE)) {
    if (use_conda) { # nocov
      install_conda(envname) # nocov
      reticulate::use_condaenv(envname, required = TRUE) # nocov
    } else {
      install_venv(envname)
      reticulate::use_virtualenv(envname, required = TRUE)
    }
  }

  # import the acro package and instantiate an object
  acro <- reticulate::import("acro", delay_load = TRUE)
  acroEnv$ac <- acro$ACRO(suppress = suppress)

  invisible(acroEnv$ac)
}
