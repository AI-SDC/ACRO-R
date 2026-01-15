# Globals -----------------------------------------------------------------
acro_venv <- "r-acro"
acro_pkg <- "acro==0.4.11"
ch <- "conda-forge"


# Internal helper: resolve Python executable
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


# Internal helper: install ACRO in a Conda environment
## nocov start
install_conda <- function(envname) { # nocov
  if (!reticulate::condaenv_exists(envname = envname, conda = "auto")) {
    reticulate::conda_create(envname = envname, python_version = "3.12", channel = ch)
    reticulate::conda_install(envname = envname, packages = acro_pkg, channel = ch)
  }
}
## nocov end


# Internal helper: install ACRO in a Python virtual environment
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


# Internal helper: resolve whether Conda should be used
get_use_conda <- function(use_conda = NULL) {
  if (is.null(use_conda)) {
    use_conda <- tolower(Sys.getenv("ACRO_USE_CONDA")) %in% c("1", "true", "yes")
  }
  use_conda <- isTRUE(use_conda) # default FALSE

  if (use_conda && is.null(reticulate::conda_binary())) { # nocov
    stop("Conda requested but no Miniconda installation found", call. = FALSE) # nocov
  }

  return(use_conda)
}


#' Initialise an ACRO object
#'
#' @param suppress Whether to automatically apply suppression.
#' @param envname Name of the Python environment to use.
#' @param use_conda Whether to use a Conda environment.
#'   If `NULL`, looks for environment variable `ACRO_USE_CONDA`,
#'   defaults to `FALSE` if unset.
#'
#' @return Invisibly returns the ACRO object, which is used internally.
#' @export
acro_init <- function(suppress = FALSE, envname = acro_venv, use_conda = NULL) {
  # define the environment
  use_conda <- get_use_conda(use_conda)

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
