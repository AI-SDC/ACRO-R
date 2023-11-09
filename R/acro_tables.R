#' Compute a simple cross tabulation of two (or more) factors.
#'
#' @param index Values to group by in the rows.
#' @param columns Values to group by in the columns.
#' @param values  Array of values to aggregate according to the factors. Requires `aggfunc` be specified.
#' @param aggfunc If specified, requires `values` be specified as well.
#'
#' @return Cross tabulation of the data
#' @export
#'
#'@examples
#'{
#' # Initilaise an ACRO object
#' acro_init()
#' # Call the acro_crosstab function
#' table = acro_crosstab(index=nursery_data$health, columns = nursery_data$finance)
#' }

acro_crosstab <- function(index, columns, values=NULL, aggfunc=NULL)
{
  "ACRO crosstab"
  if (is.null(ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  table = ac$crosstab(index, columns, values=values, aggfunc=aggfunc)
  return(table)
}

#' Compute a simple cross tabulation of two (or more) factors.
#'
#' @param index Values to group by in the rows.
#' @param columns Values to group by in the columns.
#' @param dnn The names to be given to the dimensions in the result
#' @param deparse.level Controls how the default `dnn` is constructed.
#' @param ... Any other parameteres.
#'
#' @return Cross tabulation of the data
#' @export
#'
#' @examples
#'{
#' # Initilaise an ACRO object
#' acro_init()
#' # Call the acro_table function
#' table = acro_table(index=nursery_data$recommend, columns = nursery_data$parents)
#' }

acro_table <- function(index, columns, dnn=NULL, deparse.level=0, ...)
{
  if (is.null(ac)) {
    stop("ACRO has not been initialised. Please first call acro_init().")
  }
  "ACRO crosstab without aggregation function"
  if (is.null(dnn)) {
    if (deparse.level == 0) {
      row_names <- list("")
      col_names <- list("")
    } else if (deparse.level == 1) {
      tryCatch({
        index_symbol <- admiraldev::assert_symbol(substitute(index))
        row_names <- list(deparse(index_symbol))},
        error = function(e) {
          row_names <- list("")
        })
      tryCatch({
        column_symbol <- admiraldev::assert_symbol(substitute(columns))
        col_names <- list(deparse(column_symbol))},
        error = function(e) {
          col_names <- list("")
        })
    } else if (deparse.level == 2) {
      row_names <- list(deparse((substitute(index))))
      col_names <- list(deparse(substitute(columns)))
    }
  }
  else {
    row_names <- list(dnn[1])
    col_names <- list(dnn[2])
  }

  table <- ac$crosstab(index, columns, rownames=row_names, colnames=col_names)
  # Check for any unused arguments
  if (length(list(...)) > 0) {
    warning("Unused arguments were provided: ", paste0(names(list(...)), collapse = ", "), "\n", "To find more help about the function use: acro_help(\"acro_table\")\n")
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
#'
#' @examples
#'{
#' # Initilaise an ACRO object
#' acro_init()
#' # Call the acro_pivot_table function
#' table = acro_pivot_table(data=nursery_data,
#'                          index = "parents",
#'                          values = "children",
#'                          aggfunc = list("mean", "std"))
#' }

acro_pivot_table <- function(data, values=NULL, index=NULL, columns=NULL, aggfunc="mean")
{
  "ACRO pivot table"
  if (is.null(ac)) {
    stop("ACRO has not been initialised. Please first call acro_init()")
  }
  table = ac$pivot_table(data, values=values, index=index, columns=columns, aggfunc=aggfunc)
  return(table)
}

# acro_hist <- function(column, freq)

