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

## Pull Request Standards

All PRs **must** meet the following requirements before being accepted.

### Provenance and legal

- Contributors assert copyright ownership and release their contribution under the [MIT License](../blob/main/LICENSE).
- All contributor details are present in `CITATION.cff`. First-time contributors must add themselves.
- If work is copied from another open source repository, the license must be checked and included.

### Code quality

- The PR is small and addresses a single specific issue.
- Code is high quality. This includes: small focused functions and modules, no duplication, fully documented, extensive use of type hints, no unused arguments, no more than 3 levels of nesting except in rare justified cases, no bloat.
- No inline pragmas. If a rule suppression is genuinely necessary, add a per-file setting to `pyproject.toml` to keep the source code clean.
- New dependencies are added to `pyproject.toml`.
- All [pre-commit checks](#pre-commit) pass, including automatic formatting and linting. Run pre-commit/prek locally before opening a PR.

### Tests

- All existing tests pass.
- New code is accompanied by appropriate tests.
- Code coverage is at least 90% statement coverage.
- Tests verify real-world effects, not just that lines of code execute.
- Run the full test suite locally before opening a PR. CI minutes are not unlimited.

### Pull request description

- The PR title follows [Conventional Commits](#pull-request-titles) format.
- The description is **short**, written in your own words, and explains what changed and why. See the [AI Policy](AI_POLICY.md) for what this means in practice. AI-generated descriptions are not acceptable.
- Do not add issue or PR numbers to the title manually. To close an issue automatically, add the closing keyword in a comment instead.

### AI

- Any use of AI tools to assist with code or documentation is disclosed in the opening PR comment, including the specific tool and version. See the [AI Policy](AI_POLICY.md) for the full requirements.


## Pull Request Titles

Use [Conventional Commits](https://www.conventionalcommits.org) for PR titles (squash-merge messages). This allows automated changelog generation. Common prefixes:

```
feat — new feature
fix — bug fix
docs — documentation changes
style — formatting/styling (no code logic)
refactor — code changes without feature/bug impact
perf — performance improvements
test — adding/updating tests
build — changes to build system or dependencies
ci — changes to CI config/scripts
chore — miscellaneous maintenance tasks
revert — reverts an earlier commit
```

## Release Workflow

`NEWS.md` is generated locally before each release using [git-cliff](https://github.com/orhun/git-cliff). It reads merged PR titles (via squash-merge commit messages) since the last release tag and formats them to match the existing changelog style.

### Install git-cliff

Download a prebuilt binary from the [releases page](https://github.com/orhun/git-cliff/releases) or install via a package manager:

```shell
# homebrew (macOS / Linux)
brew install git-cliff

# winget (Windows)
winget install git-cliff
```

### Generate the changelog entry

Run the following on `main` immediately before tagging a new release, replacing `X.Y.Z` with the new version:

```shell
git cliff --config cliff.toml --unreleased --tag "VX.Y.Z" --prepend NEWS.md
```

Review and edit `NEWS.md` as needed (e.g. to add extra context or merge duplicate entries), then commit:

```shell
git add NEWS.md
git commit -m "docs: update changelog"
git tag VX.Y.Z
```

The configuration lives in `cliff.toml` at the repository root. It automatically:

- Converts `(#NNN)` PR references into markdown links.
- Skips noise commits (pre-commit auto-fixes, changelog and release-prep commits).
- Groups commits that do not follow Conventional Commits under an "Other" heading so nothing is dropped (see [Pull Request Titles](#pull-request-titles)).

## CRAN Submission

A useful command to run before submitting:

```shell
R CMD build . && R CMD check --as-cran $(ls -t . | head -n1)
```
