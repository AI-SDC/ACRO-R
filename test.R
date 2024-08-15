# install the packages and load them
install.packages("devtools")
install.packages("usethis")
install.packages("covr")
library(devtools)
library(covr)

# check that there are no errors, warnings or notes
devtools::test()

# devtools::check()
