## acro

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

### Funding Statement

This work was funded by UK Research and Innovation under Grant Numbers MC_PC_21033  and MC_PC_23006 as part of Phase 1 of the Data and Analytics Research Environments UK (DARE UK) program (https://dareuk.org.uk/), delivered in partnership with Health Data Research UK (HDR UK) and Administrative Data Research UK (ADR UK). The specific projects were Semi-Automatic checking of Research Outputs (SACRO -MC_PC_23006) and   Guidelines and Resources for AI Model Access from Trusted Research environments (GRAIMATTER - MC_PC_21033). This project has also been supported by MRC and EPSRC [grant number MR/S010351/1].

<img src="inst/Images/UK_Research_and_Innovation_logo.svg" alt="Alt Text" width="20%">
<img src="inst/Images/health-data-research-uk-hdr-uk-logo-vector.png" alt="Alt Text" width="20%">
<img src="inst/Images/logo_print.png" alt="Alt Text" width="20%">




