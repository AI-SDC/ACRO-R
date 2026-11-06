# Fits a Cox proportional hazards regression model.

Fits a Cox proportional hazards model via ACRO. This function is
designed as a drop-in replacement for
[`survival::coxph()`](https://rdrr.io/pkg/survival/man/coxph.html).

## Usage

``` r
acro_coxph(
  formula,
  data,
  weights = NULL,
  subset = NULL,
  na.action = NULL,
  robust = TRUE,
  init = NULL,
  cluster = NULL,
  istate = NULL,
  statedata = NULL,
  ...
)
```

## Arguments

- formula:

  a formula object, with the response on the left of a ~ operator, and
  the terms on the right. The response must be a survival object as
  returned by the Surv function.

- data:

  a data.frame in which to interpret the variables named in the formula,
  or in the subset and the weights argument.

- weights:

  vector of case weights

- subset:

  expression indicating which subset of the rows of data should be used
  in the fit. All observations are included by default.

- na.action:

  a missing-data filter function.

- robust:

  should a robust variance be computed.

- init:

  vector of initial values of the iteration.

- cluster:

  optional variable which clusters the observations, for the purposes of
  a robust variance. If present, it implies robust. This variable will
  normally be found in data.

- istate:

  optional variable giving the current state at the start each interval.

- statedata:

  optional data set used to describe multistate models.

- ...:

  Any other parameters.

## Value

Fitted CoxPHFitter results object

## Details

Please note that multi-state models (using `istate` or `statedata`) and
time-varying covariate models are currently not supported.
