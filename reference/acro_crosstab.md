# Compute a simple cross tabulation of two (or more) factors.

Compute a simple cross tabulation of two (or more) factors.

## Usage

``` r
acro_crosstab(index, columns, values = NULL, aggfunc = NULL)
```

## Arguments

- index:

  Values to group by in the rows.

- columns:

  Values to group by in the columns.

- values:

  Array of values to aggregate according to the factors. Requires
  `aggfunc` be specified.

- aggfunc:

  If specified, requires `values` be specified as well.

## Value

Cross tabulation of the data
