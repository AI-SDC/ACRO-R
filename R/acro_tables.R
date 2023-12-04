#' Compute a simple cross tabulation of two (or more) factors.
#'
#' @param index Values to group by in the rows.
#' @param columns Values to group by in the columns.
#' @param values  Array of values to aggregate according to the factors. Requires `aggfunc` be specified.
#' @param aggfunc If specified, requires `values` be specified as well.
#'
#' @return Cross tabulation of the data
#' @export

acro_crosstab <- function(index, columns, values=NULL, aggfunc=NULL)
{
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  table = acroEnv$ac$crosstab(index, columns, values=values, aggfunc=aggfunc)
  return(table)
}

#' Compute a simple cross tabulation of two (or more) factors.
#'
#' @param index Values to group by in the rows.
#' @param columns Values to group by in the columns.
#' @param dnn The names to be given to the dimensions in the result
#' @param deparse.level Controls how the default `dnn` is constructed.
#' @param ... Any other parameters.
#'
#' @return Cross tabulation of the data
#' @export

acro_table <- function(index, columns, dnn=NULL, deparse.level=0, ...)
{
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  "ACRO crosstab without aggregation function"
  if (is.null(dnn)) {
    if (deparse.level == 0) {
      acroEnv$row_names <- list("")
      acroEnv$col_names <- list("")
    } else if (deparse.level == 1) {
      tryCatch({
        index_symbol <- admiraldev::assert_symbol(substitute(index))
        acroEnv$row_names <- list(deparse(index_symbol))},
        error = function(e) {
          acroEnv$row_names <- list("")
        })
      tryCatch({
        column_symbol <- admiraldev::assert_symbol(substitute(columns))
        acroEnv$col_names <- list(deparse(column_symbol))},
        error = function(e) {
          acroEnv$col_names <- list("")
        })
    } else if (deparse.level == 2) {
      acroEnv$row_names <- list(deparse((substitute(index))))
      acroEnv$col_names <- list(deparse(substitute(columns)))
    }
  }
  else {
    acroEnv$row_names <- list(dnn[1])
    acroEnv$col_names <- list(dnn[2])
  }

  table <- acroEnv$ac$crosstab(index, columns, rownames=acroEnv$row_names, colnames=acroEnv$col_names)
  # Check for any unused arguments
  if (length(list(...)) > 0) {
    warning("Unused arguments were provided: ", paste0(names(list(...)), collapse = ", "), "\n", "Please use the help command to learn more about the function.")
  }
  return(table)
}

#' Pivot table
#'
#' @param data The data to operate on.
#' @param values Column to aggregate, optional.
#' @param index If an array is passed, it must be the same length as the data. The list can contain any of the other types (except list). Keys to group by on the pivot table index. If an array is passed, it is being used as the same manner as column values.
#' @param columns If an array is passed, it must be the same length as the data. The list can contain any of the other types (except list). Keys to group by on the pivot table column. If an array is passed, it is being used as the same manner as column values.
#' @param aggfunc  If list of strings passed, the resulting pivot table will have hierarchical columns whose top level are the function names
#'
#' @return Cross tabulation of the data.
#' @export

acro_pivot_table <- function(data, values=NULL, index=NULL, columns=NULL, aggfunc="mean")
{
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  table = acroEnv$ac$pivot_table(data, values=values, index=index, columns=columns, aggfunc=aggfunc)
  return(table)
}

#' Histogram
#'
#' @param data The object holding the data.
#' @param column The column that will be used to plot the histogram.
#' @param breaks Number of histogram bins to be used.
#' @param freq If False, the result will contain the number of samples in each bin. If True, the result is the value of the probability density function at the bin.
#' @param col The color of the plot.
#' @param filename The name of the file where the plot will be saved.
#'
#' @return The histogram.
#' @export

acro_hist <- function(data, column, breaks=10, freq=TRUE, col=NULL, filename="histogram.png")
{
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  histogram = acroEnv$ac$hist(data=data, column=column, bins=as.integer(breaks), density=freq, color=col, filename=filename)
  # Load the saved histogram
  image <- png::readPNG(histogram)
  grid::grid.raster(image)
  return(histogram)
}

#' Survival analysis
#'
#' @param time An array of times (censoring times or event times).
#' @param status Status at the event time.
#' @param output  A string determine the type of output. Available options are table or plot.
#' @param filename The name of the file where the plot will be saved.
#'
#' @return The survival table or plot.
#' @export

acro_surv_func <- function(time, status, output, filename="kaplan-meier.png")
{
  if (is.null(acroEnv$ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  results = acroEnv$ac$surv_func(time=time, status=status, output=output, filename=filename)
  if (output=="plot"){
    # Load the saved survival plot
    image <- png::readPNG(results[[2]])
    grid::grid.raster(image)
  }
  return(results)
  }



