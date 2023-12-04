if (!exists("acroEnv", envir = emptyenv(), inherits = FALSE)) {
  # Create a package-specific environment
  acroEnv <- new.env(parent = emptyenv())
  acroEnv$ac <- NULL
}
