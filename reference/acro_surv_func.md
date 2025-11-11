# Survival analysis

Survival analysis

## Usage

``` r
acro_surv_func(time, status, output, filename = "kaplan-meier.png")
```

## Arguments

- time:

  An array of times (censoring times or event times).

- status:

  Status at the event time.

- output:

  A string determine the type of output. Available options are table or
  plot.

- filename:

  The name of the file where the plot will be saved.

## Value

The survival table or plot.
