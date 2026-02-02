
# acro 0.1.7
* Added support for installation via conda
* Added support for specifying config files when acro session is started
* Added support for specifying whether suppression is on or off when acro session is started
* Added support for toggling suppression dynamically during session via   `acro_enable_supression()`
  and `acro_disable_suppression()`
* Improved documentation in package and at [https://sacro-tools.org/](https://sacro-tools.org/)
* Added Support for variable names with spaces when calling crosstab
* Set status of disclosive outputs to 'review' (previously 'fail') when suppression has been applied
* Automatically add exception message when applying suppression to an output
* Make `acro_finalise()` non-interactive by default (interactive is now option at call time)

# acro 0.1.6

* Upgrade ACRO Python backend to v0.4.11, supporting Python 3.14.

# acro 0.1.5

* Upgrade ACRO Python backend to v0.4.9, addressing installation problems due to scipy dependency update.

# acro 0.1.4

* Upgrade ACRO Python backend to v0.4.8, supporting numpy v2 for a more seamless installation with Python 3.13.

# acro 0.1.3

* Upgrade ACRO Python backend to v0.4.7, supporting pandas v2 for a more seamless installation with Python 3.12.

# acro 0.1.2

## Bug fixes

* Fix Python virtual environment creation.
* Pin Python `acro` package to v0.4.6 for stability.

# acro 0.1.1

* First version.
