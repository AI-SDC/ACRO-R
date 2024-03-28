# This code can be used to do the checks to the R package before submit to CRAN

# install the packages and load them
install.packages("devtools")
install.packages("usethis")
install.packages("covr")
library(devtools)
library(covr)

# check that there are no errors, warnings or notes
devtools::check()

# Check package coverage
covr::package_coverage()

# Run tests
devtools::test()

# Check spelling - No typo
spelling::spell_check_package()

#check your package on several platforms
#rhub::check_for_cran()

# If you would like to add comments to CRAN team
# Creates cran-comments.md, a template for your communications with CRAN when submitting a package.
usethis::use_cran_comments(open = rlang::is_interactive())

# If you are submitting a new version to CRAN, Upgrade version number using this command or you can do it manually
usethis::use_version(which = c("patch", "minor", "major", "dev")[1])

# When you are happy with the package and want to submit it to CRAN, you can do this manually by converting the package source directory into a single bundled file and submit this file to CRAN (https://xmpalantir.wu.ac.at/cransubmit/)
devtools::build()

# Or if you decide to do the release automatically then you can run this command
# devtools::release()
