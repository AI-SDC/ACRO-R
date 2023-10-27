.onLoad <- function(...) {
  reticulate::use_virtualenv("r-acro", required = FALSE)
  ac <<- NULL
}
