# acro

The **acro** package is an interface to the python package 'acro' [GitHub link](https://github.com/AI-SDC/ACRO). It provides a comprehensive set of tools for automating the statistical disclosure control (SDC) of research outputs.The package assists researchers and output checkers by distinguishing between research output that is safe to publish, output that requires further analysis, and output that cannot be published because of substantial disclosure risk. The package includes functionality to:

-   Identify potentially disclosed outputs against a range of commonly used disclosure tests

-   Suppress outputs where required.

-   Report reasons for suppression.

-   Produce simple summary documents that trusted research environment staff can use to streamline their workflow.

### Getting started

#### Installation

Install the **acro** package from CRAN as follows:

``` r
install.packages("acro")
```

#### Python version

By default, acro uses an isolated python virtual environment named "r-acro".

#### Usage

Before using any function from the package, an acro object should be initialised first using the following R code:
``` r
acro_init()
```
Then the function can be called.
```




