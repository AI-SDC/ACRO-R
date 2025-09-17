# Install from CRAN
install.packages("reticulate")
install.packages("farff")
install.packages("IRkernel")
install.packages("acro")

# Make R kernel available in Jupyter
IRkernel::installspec(user = FALSE)
