#' Rename outputs
#'
#' @param old The old name of the output.
#' @param new The new name of the output.
#'
#' @return No return value, called for side effects
#' @export

acro_rename_output <- function(old, new) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$rename_output(old, new)
}

#' Remove outputs
#'
#' @param name  Key specifying which output to remove, e.g., 'output_0'.
#'
#' @return No return value, called for side effects
#' @export

acro_remove_output <- function(name) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$remove_output(name)
}

#' Add comments to outputs
#'
#' @param name The name of the output.
#' @param comment The comment.
#'
#' @return No return value, called for side effects
#' @export

acro_add_comments <- function(name, comment) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$add_comments(name, comment)
}

#' Adds an unsupported output to the results dictionary
#'
#' @param filename The name of the file that will be added to the list of the outputs.
#' @param comment An optional comment.
#'
#' @return No return value, called for side effects
#' @export

acro_custom_output <- function(filename, comment = NULL) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$custom_output(filename, comment)
}

#' Adds an exception request to an output.
#'
#' @param name The name of the output.
#' @param reason The comment.
#'
#' @return No return value, called for side effects
#' @export

acro_add_exception <- function(name, reason) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$add_exception(name, reason)
}

#' Prints the current results dictionary.
#'
#' @return No return value, called for side effects
#' @export

acro_print_outputs <- function() {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$print_outputs()
}

#' Creates a results file for checking.
#'
#' @param path Name of a folder to save outputs.
#' @param ext Extension of the results file. Valid extensions are json or xlsx.
#'
#' @return No return value, called for side effects
#' @export

acro_finalise <- function(path, ext) {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$finalise(path, ext)
}


#' Turns suppression on during a session
#'
#' @return No return value, called for side effects
#' @export

acro_enable_suppression <- function() {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$enable_suppression()
}

#' Turns suppression off during a session
#'
#' @return No return value, called for side effects
#' @export

acro_disable_suppression <- function() {
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  acroEnv$ac$disable_suppression()
}
