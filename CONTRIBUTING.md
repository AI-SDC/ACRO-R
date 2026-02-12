# Contributing

Contributions to this repository are very welcome. All contributions must be
made under the same terms as the project: MIT License.

## Pre-commit

The `.pre-commit-config.yaml` specifies a number of formatting/checking tools.

The [pre-commit](https://pre-commit.com) tool can be installed with:

```
$ pip install pre-commit
```

And run with:

```
$ pre-commit run -a
```

## Testing

Some prerequisites for testing locally:

```R
install.packages("spelling")
install.packages("testthat")
install.packages("devtools")
```

Run tests locally:

```
$ R -e "devtools::check()"
```

## Coverage

Some prerequisites for generating coverage locally:

```R
install.packages("covr")
install.packages("DT")
install.packages("htmltools")
```

Generate coverage report locally:

```
$ R -e 'Sys.setenv(NOT_CRAN = "true"); covr::package_coverage()'
```

## Linting

```R
install.packages("lintr")
```

```
$ R -e 'lintr::lint_package()'
```

## Notes

To identify packages needed to install R packages, for example devtools:

```R
install.packages("pak")

writeLines(pak::pkg_system_requirements("devtools", "ubuntu", "22.04"))
```

To remove the local virtual Python environment, delete the `r-acro` folder.
On GNU/Linux this is typically located in `~/.virtualenvs`

## CRAN Submission

A useful command to run before submitting:

```shell
R CMD build . && R CMD check --as-cran $(ls -t . | head -n1)
```
