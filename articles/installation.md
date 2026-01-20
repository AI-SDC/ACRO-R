# Installation Guide

## Installation Guide

### Install from CRAN

Install the **acro** package from CRAN as follows:

``` r
install.packages("acro")
```

### Development Version

To install the development version from GitHub:

``` r
# Install devtools if you haven't already
install.packages("devtools")

# Install ACRO-R from GitHub
devtools::install_github("AI-SDC/ACRO-R")
```

### Prerequisites

ACRO-R requires: - R version 4.0 or higher - Python 3.10+ or higher

### Initialization

The package interfaces with the Python ACRO library. Use
[`acro_init()`](../reference/acro_init.md) to automatically handle the
Python environment setup:

``` r
library("acro")
acro_init(suppress = TRUE)
```

This will create a virtual environment and install the required Python
packages if they are missing.

### Troubleshooting

If you are having problems installing the package, please see the
simplified steps above or check the [GitHub
issues](https://github.com/AI-SDC/ACRO-R/issues).

### Verification

To verify your installation works correctly:

``` r
library("acro")
acro_init(suppress = TRUE)
```

If this runs without errors, your installation is successful!
