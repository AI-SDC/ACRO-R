## ACRO: Tools for the Semi-Automatic Checking of Research Outputs

[![IEEE
Xplore](https://img.shields.io/badge/IEEE%20Xplore-10.1109/TP.2025.3566052-blue)](https://doi.org/10.1109/TP.2025.3566052)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://opensource.org/licenses/MIT)
[![CRAN](https://www.r-pkg.org/badges/version/acro)](https://CRAN.R-project.org/package=acro)
[![check](https://github.com/AI-SDC/ACRO-R/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AI-SDC/ACRO-R/actions?query=workflow%3AR-CMD-check)
[![codecov](https://codecov.io/gh/AI-SDC/ACRO-R/graph/badge.svg?token=VxbjBHzeXU)](https://app.codecov.io/gh/AI-SDC/ACRO-R)

This repository maintains the ACRO R package, which is an interface to
the Python [ACRO](https://github.com/AI-SDC/ACRO) package.

ACRO is a free and open source tool that supports the semi-automated
checking of research outputs (SACRO) for privacy disclosure within
secure data environments. SACRO is a framework that applies
best-practice principles-based [statistical disclosure
control](https://en.wikipedia.org/wiki/Statistical_disclosure_control)
(SDC) techniques on-the-fly as researchers conduct their analysis. SACRO
is designed to assist human checkers rather than seeking to replace them
as with current automated rules-based approaches.

The ACRO package is a lightweight Python tool that sits over well-known
analysis tools that produce outputs such as tables, plots, and
statistical models. This package adds functionality to:

- automatically identify potentially disclosive outputs against a range
  of commonly used disclosure tests;
- apply optional disclosure mitigation strategies as requested;
- report reasons for applying SDC;
- and produce simple summary documents trusted research environment
  staff can use to streamline their workflow and maintain auditable
  records.

This creates an explicit change in the dynamics so that SDC is something
done with researchers rather than to them, and enables more efficient
communication with checkers.

A graphical user interface
([SACRO-Viewer](https://github.com/AI-SDC/SACRO-Viewer)) supports human
checkers by displaying the requested output and results of the checks in
an immediately accessible format, highlighting identified issues,
potential mitigation options, and tracking decisions made.

Additional programming languages such as this R package are supported by
providing front-end packages that interface with the core ACRO Python
back-end.

### Installation

Prerequisite: you must have [Python](https://www.python.org)
pre-installed.

Install the **acro** package from CRAN as follows:

``` r
install.packages("acro")
```

If you are having problems installing the package, please see the more
detailed [installation
guide](https://AI-SDC.github.io/ACRO-R/inst/INSTALL.md).

### Usage

Before using any function from the package, an acro object should be
initialised using the following R code:

``` r
>>> library("acro")
>>> acro_init(suppress = TRUE)
```

### Try Online with MyBinder

Try an example notebook in [RStudio
online](https://mybinder.org/v2/gh/AI-SDC/ACRO-R/main?urlpath=rstudio)
on MyBinder.org.

Select the `example-notebook.Rmd` in the bottom-right pane after
loading.

### Documentation

The github-pages contains pre-built
[documentation](https://ai-sdc.github.io/ACRO-R/).

Additionally, see our [paper describing the SACRO
framework](https://doi.org/10.1109/TP.2025.3566052) to learn about its
principles-based SDC methodology and usage.

### Acknowledgement

This work was funded by UK Research and Innovation under Grant Numbers
MC_PC_21033 and MC_PC_23006 as part of Phase 1 of the Data and Analytics
Research Environments UK ([DARE UK](https://dareuk.org.uk/)) programme,
delivered in partnership with Health Data Research UK (HDR UK) and
Administrative Data Research UK (ADR UK). The specific projects were
Semi-Automatic checking of Research Outputs (SACRO; MC_PC_23006) and
Guidelines and Resources for AI Model Access from Trusted Research
environments (GRAIMATTER; MC_PC_21033). This project has also been
supported by MRC and EPSRC \[grant number MR/S010351/1\].

![Alt Text](inst/Images/UK_Research_and_Innovation_logo.svg)![Alt
Text](inst/Images/health-data-research-uk-hdr-uk-logo-vector.png)![Alt
Text](inst/Images/logo_print.png)
