## -----------------------------------------------------------------------------
# Check if acro is installed
if (!requireNamespace("acro", quietly = TRUE)) {
  # If not installed, install it
  install.packages("acro")
}


## -----------------------------------------------------------------------------
library("acro")


## -----------------------------------------------------------------------------
acro_init()


## -----------------------------------------------------------------------------
data <- farff::readARFF("data/nursery.arff")
data <- as.data.frame(data)

names(data)[names(data) == "class"] <- "recommendation"


## -----------------------------------------------------------------------------
data$children <- as.numeric(as.character(data$children))
data[is.na(data)] <- round(runif(sum(is.na(data)), min = 4, max = 10), 0)
unique(data$children)


## -----------------------------------------------------------------------------
head(data)


## -----------------------------------------------------------------------------
rows <- data[, c("recommendation")]
columns <- data[, c("parents")]

table <- acro_table(index = rows, columns = columns, deparse.level = 1)
table


## -----------------------------------------------------------------------------

acro_enable_suppression()
table <- acro_table(index = rows, columns = columns, deparse.level = 1)
table


## -----------------------------------------------------------------------------
myrows <- list(data[, c("parents")], data[, c("finance")])
mycolumns <- data[, c("recommendation")]
myvalues <- data[, c("children")]
# convert the values to an array
myvalues <- matrix(myvalues, ncol = 1)


table4 <- acro_crosstab(
  index = myrows,
  columns = mycolumns,
  values = myvalues,
  aggfunc <- list("mean")
)
table4


## -----------------------------------------------------------------------------

help(package = "acro")


## -----------------------------------------------------------------------------
details <- acro_print_outputs()


## -----------------------------------------------------------------------------
acro_remove_output("output_0")


## -----------------------------------------------------------------------------
acro_rename_output("output_1", " crosstab_recommendation_vs_parents")
acro_rename_output("output_2", "mean_children_by_parents_finance_vs_recommendation")


## -----------------------------------------------------------------------------

acro_add_comments(
  "mean_children_by_parents_finance_vs_recommendation",
  "too few cases of recommend to report"
)


## -----------------------------------------------------------------------------
acro_custom_output("acro_demo_2026.R", "This is the code that produced this session")


## -----------------------------------------------------------------------------
myfolder <- "Routputs"
suffix <- format(Sys.time(), "%e_%m_%Y_%H_%M")
foldername <- paste(myfolder, suffix, sep = "_")
acro_finalise(foldername, ext = "json")
