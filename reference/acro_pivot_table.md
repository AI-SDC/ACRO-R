# Pivot table

Pivot table

## Usage

``` r
acro_pivot_table(
  data,
  values = NULL,
  index = NULL,
  columns = NULL,
  aggfunc = "mean"
)
```

## Arguments

- data:

  The data to operate on.

- values:

  Column to aggregate, optional.

- index:

  If an array is passed, it must be the same length as the data. The
  list can contain any of the other types (except list). Keys to group
  by on the pivot table index. If an array is passed, it is being used
  as the same manner as column values.

- columns:

  If an array is passed, it must be the same length as the data. The
  list can contain any of the other types (except list). Keys to group
  by on the pivot table column. If an array is passed, it is being used
  as the same manner as column values.

- aggfunc:

  If list of strings passed, the resulting pivot table will have
  hierarchical columns whose top level are the function names

## Value

Cross tabulation of the data.
