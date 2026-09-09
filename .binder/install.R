install.packages("reticulate")
install.packages("farff")

if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_local(".", dependencies = TRUE, upgrade = "never")
