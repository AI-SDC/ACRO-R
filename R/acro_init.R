install_acro <- function(..., envname = "r-acro") {
    reticulate::py_install("acro", envname = envname, ...)
}

#' Initialize an ACRO object
#'
#' @return NULL
#' @export
#'
#' @examples acro_init()
acro_init <- function() {
  if (!reticulate::py_module_available("acro")) {
    install_acro()
  }
  acro <- reticulate::import("acro")
  ac <<- acro$ACRO()
}
