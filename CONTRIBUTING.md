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

## Notes

Some prerequisites for testing:

```R
install.packages("spelling")
install.packages("testthat")
```

Checking the package:

```
$ R CMD build .
$ R CMD check acro_0.1.2.tar.gz
```

To identify packages needed to install R packages, for example devtools:

```R
install.packages("pak")

writeLines(pak::pkg_system_requirements("devtools", "ubuntu", "22.04"))
```

Install devtools:

```R
install.packages("devtools")
```

Load the local repository:

```R
devtools::load_all(".")
```

To remove the local virtual Python environment, delete the `r-acro` folder.
On GNU/Linux this is typically located in `~/.virtualenvs`


To execute tests locally:

```R
devtools::test()
```
