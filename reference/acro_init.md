# Initialise an ACRO object

Initialise an ACRO object

## Usage

``` r
acro_init(
  config = "default",
  suppress = FALSE,
  envname = acro_venv,
  use_conda = NULL
)
```

## Arguments

- config:

  Name of a yaml configuration file with safe parameters.

- suppress:

  Whether to automatically apply suppression.

- envname:

  Name of the Python environment to use.

- use_conda:

  Whether to use a Conda environment. If `NULL`, looks for environment
  variable `ACRO_USE_CONDA`, defaults to `FALSE` if unset.

## Value

Invisibly returns the ACRO object, which is used internally.
