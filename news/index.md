# Changelog

## acro 0.1.7

- Added support for installation via conda
- Added support for specifying config files when acro session is started
- Added support for specifying whether suppression is on or off when
  acro session is started
- Added support for toggling suppression dynamically during session via
  `acro_enable_supression()` and
  [`acro_disable_suppression()`](../reference/acro_disable_suppression.md)
- Improved documentation in package and at <https://sacro-tools.org/>
- Added Support for variable names with spaces when calling crosstab
- Set status of disclosive outputs to ‘review’ (previously ‘fail’) when
  suppression has been applied
- Automatically add exception message when applying suppression to an
  output
- Make [`acro_finalise()`](../reference/acro_finalise.md)
  non-interactive by default (interactive is now option at call time)

## acro 0.1.6

CRAN release: 2025-11-11

- Upgrade ACRO Python backend to v0.4.11, supporting Python 3.14.

## acro 0.1.5

CRAN release: 2025-07-03

- Upgrade ACRO Python backend to v0.4.9, addressing installation
  problems due to scipy dependency update.

## acro 0.1.4

CRAN release: 2025-01-29

- Upgrade ACRO Python backend to v0.4.8, supporting numpy v2 for a more
  seamless installation with Python 3.13.

## acro 0.1.3

CRAN release: 2024-10-22

- Upgrade ACRO Python backend to v0.4.7, supporting pandas v2 for a more
  seamless installation with Python 3.12.

## acro 0.1.2

CRAN release: 2024-08-19

### Bug fixes

- Fix Python virtual environment creation.
- Pin Python `acro` package to v0.4.6 for stability.

## acro 0.1.1

CRAN release: 2023-12-01

- First version.
