# Compute a simple cross tabulation of two (or more) factors.

Compute a simple cross tabulation of two (or more) factors.

## Usage

``` r
acro_crosstab(
  index,
  columns,
  values = NULL,
  rownames = NULL,
  colnames = NULL,
  aggfunc = NULL,
  margins = FALSE,
  margins_name = "All",
  dropna = TRUE,
  normalize = FALSE,
  show_suppressed = FALSE
)
```

## Arguments

- index:

  Values to group by in the rows.

- columns:

  Values to group by in the columns.

- values:

  Array of values to aggregate according to the factors. Requires
  `aggfunc` be specified.

- rownames:

  If passed, must match number of row arrays passed.

- colnames:

  If passed, must match number of column arrays passed.

- aggfunc:

  If specified, requires `values` be specified as well.

- margins:

  dd row/column margins (subtotals).

- margins_name:

  Name of the row/column that will contain the totals when margins is
  True.

- dropna:

  Do not include columns whose entries are all NaN.

- normalize:

  Normalize by dividing all values by the sum of values.

- show_suppressed:

  how the totals are being calculated when the suppression is true

## Value

Cross tabulation of the data
