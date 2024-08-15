# install the packages and load them
install.packages("devtools")
install.packages("usethis")
install.packages("covr")
#install.packages("reticulate")
#install.packages("admiraldev")
#install.packages("png")
library(devtools)
library(covr)

# check that there are no errors, warnings or notes
devtools::test()

#devtools::check()
