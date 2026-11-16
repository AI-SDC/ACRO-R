# acro 1.1.1 (Nov 09, 2026)

### Added features
* Add functionality for Cox regression (#88)

### Documentation
* Update demo notebook (#72)

### Other
* Prepare for Acro R new release (1.1.0) (#90)
* Address CRAN notes and change to version 1.1.1 (#91)

# acro 1.0.0 (Sep 02, 2026)

### Added features
* Add support for tidyverse e.g. piping and the summarise() method (#65)
* Add support for rounding as a mitigation strategy for tables (#78)
* Add support for pie charts (#77)
* Improve compatibility between acro_hist() and R's histogram function (#71)
* Improve support for options in crosstab() and pivot_table() (#60)
* Improve support of functionality from R's built-in table() command and acro_table() (#65)
* Support the ontology-driven version of acro (v1 onwards)

### Fixes
* Catch calls to unsupported aggregation function (#63)

### Documentation
* Update demo notebook (#46)
* Add AI policy to contribution guide (#80)

### Other
* Fix linux system dependencies (#75)
* Fix ci failing for conda tests on ubuntu and macos (#59)
* Add git-cliff changelog automation (#49)

# acro 0.1.7 (Feb 02, 2026)
### Added features
* Add support for installation via conda (#35)
* Add support for specifying config files when acro session is started
* Add support for specifying whether suppression is on or off when acro session is started
* Add support for toggling suppression dynamically during session via   `acro_enable_supression()`
  and `acro_disable_suppression()` (#43)
* Add Support for variable names with spaces when calling crosstab
* Set status of disclosive outputs to 'review' (previously 'fail') when suppression has been applied
* Automatically add exception message when applying suppression to an output
* Make `acro_finalise()` non-interactive by default (interactive is now option at call time)

### Documentation
* Improve documentation in package and at 'https://acro-r.sacro-tools.org/' (#30)

# acro 0.1.6 (Nov 03, 2025)

* Upgrade ACRO Python backend to v0.4.11, supporting Python 3.14.

# acro 0.1.5 (July 02, 2025)

* Upgrade ACRO Python backend to v0.4.9, addressing installation problems due to scipy dependency update.

# acro 0.1.4 (Jan 29, 2025)

* Upgrade ACRO Python backend to v0.4.8, supporting numpy v2 for a more seamless installation with Python 3.13.

# acro 0.1.3 (Oct 22, 2024)

* Upgrade ACRO Python backend to v0.4.7, supporting pandas v2 for a more seamless installation with Python 3.12.

# acro 0.1.2 (Aug 19, 2024)

### Fixes

* Fix Python virtual environment creation.
* Pin Python `acro` package to v0.4.6 for stability.

# acro 0.1.1 (Aug 14, 2024)

* First version.
