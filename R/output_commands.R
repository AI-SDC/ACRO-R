#' Rename outputs
#'
#' @param old The old name of the output.
#' @param new The new name of the output.
#'
#' @return NULL
#' @export
#'
#' @examples
#' {
#' acro_init()
#' acro_crosstab(index=charity_data[,c("year")], columns= charity_data[,c("grant_type")])
#' acro_rename_output("output_0", "crosstab")
#' }

acro_rename_output <- function(old, new)
{
  "Rename an output"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
  }
  ac$rename_output(old, new)
}

#' Remove outputs
#'
#' @param name  Key specifying which output to remove, e.g., 'output_0'.
#'
#' @return NULL
#' @export
#'
#' @examples
#' {
#' acro_init()
#' acro_crosstab(index=charity_data[,c("year")], columns= charity_data[,c("grant_type")])
#' acro_remove_output("output_0")
#' }

acro_remove_output <- function(name)
{
  "Remove an output"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
  }
  ac$remove_output(name)
}

#' Add comments to outputs
#'
#' @param name The name of the output.
#' @param comment The comment.
#'
#' @return NULL
#' @export
#'
#' @examples
#' {
#' acro_init()
#' acro_crosstab(index=charity_data[,c("year")], columns= charity_data[,c("grant_type")])
#' acro_add_comments("output_0", "This is a crosstab")
#' }

acro_add_comments <- function(name, comment)
{
  "Add comments to an output"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
  }
  ac$add_comments(name, comment)
}

#' Adds an unsupported output to the results dictionary
#'
#' @param filename The name of the file that will be added to the list of the outputs.
#' @param comment An optional comment.
#'
#' @return NULL
#' @export
#'
#' @examples
#' {
#' acro_init()
#' acro_custom_output("XandY.jpeg")
#' }

acro_custom_output <- function(filename, comment=NULL)
{
  "Add an unsupported output"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
  }
  ac$custom_output(filename, comment)
}

#' Adds an exception request to an output.
#'
#' @param name The name of the output.
#' @param reason The comment.
#'
#' @return NULL
#' @export
#'
#' @examples
#' {
#' acro_init()
#' acro_crosstab(index=charity_data[,c("year")], columns= charity_data[,c("grant_type")])
#' acro_add_exception("output_0", "This is not disclosive")
#' }

acro_add_exception <- function(name, reason)
{
  "Add an exception request to an output"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
  }
  ac$add_exception(name, reason)
}

#' Prints the current results dictionary.
#'
#' @return NULL
#' @export
#'
#' @examples
#' {
#' acro_init()
#' acro_crosstab(index=charity_data[,c("year")], columns= charity_data[,c("grant_type")])
#' acro_print_outputs()
#' }

acro_print_outputs <- function()
{
  "Prints outputs to console"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
  }
  ac$print_outputs()
}

#' Creates a results file for checking.
#'
#' @param path Name of a folder to save outputs.
#' @param ext Extension of the results file. Valid extensions: {json, xlsx}.
#'
#' @return NULL
#' @export
#'
#' @examples
#' {
#' acro_init()
#' acro_finalise("results", "json")
#' }

acro_finalise <- function(path, ext)
{
  "Write outputs to file"
  if (is.null(ac)) {
    stop("ACRO has not been initialized. Please call acro_init() first.")
  }
  ac$finalise(path, ext)
}
