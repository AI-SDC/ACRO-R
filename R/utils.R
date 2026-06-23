#' Identify empty values; NA or NaN in an object
#'
#' @param Values to check for empty values in it
#'
#' @returns logical vector that shows the places of the empty values
#' @export

is_invalid <- function(Values) {
  # Check for NA or NaN in the object
  is.na(Values) | tolower(Values) %in% c("na", "nan")
}

#' Identify values to be excluded from an object
#'
#' @param Values to exclude from
#' @param exclude_list Items to exclude from the values
#'
#' @returns logical vector that shows the places of the items that needs to be excluded
#' @export

is_excluded <- function(Values, exclude_list) {
  # Catch everything in the exclude list
  mask <- Values %in% exclude_list

  # Catch NA if it is in the exclude list
  # We are separating the checks for NaN and NA because is.na(x) flags both the NAs and the NaNs as TRUE.
  # If the user wants to exclude one and not the other is.na() will not be able to do that
  if (any(is.na(exclude_list) & !is.nan(exclude_list))) {
    mask <- mask | (is.na(Values) & !is.nan(Values))
  }

  # Catch NA if it is in the exclude list
  if (any(is.nan(exclude_list))) {
    mask <- mask | is.nan(Values) # nocov
  }

  return(mask)
}

#' Convert data to factors and manage NA levels
#'
#' @param Values to create factors on
#' @param useNA  whether to include NA values in the table
#'
#' @returns R vector factor
#' @export

create_factors <- function(Values, useNA) {
  # Check for NAs
  char_values <- as.character(Values)
  is_true_na <- is.na(char_values)

  # Create the factors
  if (!is.factor(Values)) Values <- as.factor(Values) # nocov

  # Handle the useNA parameter
  if (useNA == "always") {
    levels(Values) <- union(levels(Values), "NA") # Always force NA
  } else if (useNA == "ifany" && any(is_true_na)) {
    levels(Values) <- union(levels(Values), "NA") # Only if NA exists
  }
  return(Values)
}

#' Convert an R factor to a Pandas Categorical
#'
#' @param Values R factor vector to be converted
#' @param pd Reference to the Python `pandas` module
#'
#' @returns A Python `pandas.Categorical` object
#' @export

to_pandas_categorical <- function(Values, pd) {
  # Build the Pandas Categorical
  pd$Categorical(
    values = as.character(Values),
    categories = levels(Values),
    ordered = is.ordered(Values)
  )
}
