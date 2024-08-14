## ACRO: Tools for the Automatic Checking of Research Outputs

This repository maintains the ACRO R package, which is an interface to the Python [ACRO](https://github.com/AI-SDC/ACRO) package.

ACRO (Automatic Checking of Research Outputs) is an open source
tool for automating the statistical disclosure control (SDC) of research
outputs. ACRO assists researchers and output checkers by distinguishing between
research output that is safe to publish, output that requires further analysis,
and output that cannot be published because of substantial disclosure risk.

It does this by providing a light-weight 'skin' that sits over well-known
analysis tools, in a variety of languages researchers might use. This adds
functionality to:

*   identify potentially disclosive outputs against a range of commonly used
    disclosure tests;
*   suppress outputs where required;
*   report reasons for suppression;
*   produce simple summary documents TRE staff can use to streamline their
    workflow.

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

This work was funded by UK Research and Innovation under Grant Numbers MC_PC_21033  and MC_PC_23006 as part of Phase 1 of the Data and Analytics Research Environments UK ([DARE UK](https://dareuk.org.uk/)) programme, delivered in partnership with Health Data Research UK (HDR UK) and Administrative Data Research UK (ADR UK). The specific projects were Semi-Automatic checking of Research Outputs (SACRO; MC_PC_23006) and Guidelines and Resources for AI Model Access from Trusted Research environments (GRAIMATTER; MC_PC_21033). This project has also been supported by MRC and EPSRC [grant number MR/S010351/1].

<img src="inst/Images/UK_Research_and_Innovation_logo.svg" alt="Alt Text" width="20%"> <img src="inst/Images/health-data-research-uk-hdr-uk-logo-vector.png" alt="Alt Text" width="20%"> <img src="inst/Images/logo_print.png" alt="Alt Text" width="20%">
