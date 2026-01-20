# Installation Guides

This document is intended to provide help installing and running acro-r.

## Prerequisites

- **Python 3.10+**: You must have Python installed on your system.
- **R**: You need a working installation of R.

## Installation

### Step 1: Install the R package

Install the **acro** package from CRAN:

```r
install.packages("acro")
```

### Step 2: Initialize ACRO

The `acro` package interfaces with the Python `acro` library. The package provides a helper function to set up the necessary Python environment and dependencies automatically.

Run the following in your R console:

```r
library("acro")
acro_init()
```

This command will:
1. Check for a valid Python installation.
2. Create a virtual environment named `r-acro`.
3. Install the required Python `acro` package into this environment.

Once initialized, you are ready to use ACRO-R!

## Troubleshooting

If you encounter issues during `acro_init()`:
- Ensure Python 3.10+ is installed and added to your system PATH.
- If you are on a restricted network, you may need to configure proxy settings for Python package installation.
