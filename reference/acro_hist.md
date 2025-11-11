# Histogram

Histogram

## Usage

``` r
acro_hist(
  data,
  column,
  breaks = 10,
  freq = TRUE,
  col = NULL,
  filename = "histogram.png"
)
```

## Arguments

- data:

  The object holding the data.

- column:

  The column that will be used to plot the histogram.

- breaks:

  Number of histogram bins to be used.

- freq:

  If False, the result will contain the number of samples in each bin.
  If True, the result is the value of the probability density function
  at the bin.

- col:

  The color of the plot.

- filename:

  The name of the file where the plot will be saved.

## Value

The histogram.
