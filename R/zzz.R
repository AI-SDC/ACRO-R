.onLoad <- function(libname, pkgname) {
  # Force matplotlib to use the headless 'Agg' backend before Python initializes
  Sys.setenv(MPLBACKEND = "Agg")
}
