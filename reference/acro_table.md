# Compute a simple cross tabulation of two (or more) factors.

Compute a simple cross tabulation of two (or more) factors.

## Usage

``` r
acro_table(
  index,
  columns,
  dnn = NULL,
  deparse.level = 0,
  useNA = "no",
  exclude = NULL,
  ...
)
```

## Arguments

- index:

  Values to group by in the rows.

- columns:

  Values to group by in the columns.

- dnn:

  The names to be given to the dimensions in the result

- deparse.level:

  Controls how the default `dnn` is constructed.

- useNA:

  whether to include NA values in the table

- exclude:

  levels to remove for all factors in index/columns

- ...:

  Any other parameters.

## Value

Cross tabulation of the data
