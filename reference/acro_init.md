# Initialise an ACRO object

Initialise an ACRO object

## Usage

``` r
acro_init(
  config = "default",
  suppress = FALSE,
  mitigation = NULL,
  round_base = NULL,
  federated = NULL,
  envname = acro_venv,
  use_conda = NULL
)
```

## Arguments

- config:

  Name of a yaml configuration file with safe parameters.

- suppress:

  Whether to automatically apply suppression.

- mitigation:

  The disclosure-control strategy applied to outputs, one of
  "none","suppress", "round".

- round_base:

  The base to round to when mitigation == "round".

- federated:

  Whether to run in federated mode.

- envname:

  Name of the Python environment to use.

- use_conda:

  Whether to use a Conda environment. If `NULL`, looks for environment
  variable `ACRO_USE_CONDA`, defaults to `FALSE` if unset.

## Value

Invisibly returns the ACRO object, which is used internally.
