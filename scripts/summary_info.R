library(dplyr)

# This document creates a list of basic summary info from our data set for the
# report

get_summary_info <- function(dataset) {
  summary <- list()
  summary$number_of_countries <- nrow(dataset)
  summary$lowest_happiness <- min(dataset$Score)
  summary$highest_happiness <- max(dataset$Score)
  summary$lowest_co2 <- min(dataset$co2)
  summary$highest_co2 <- max(dataset$co2)
  summary$co2_comparison <- max(dataset$co2) / min(dataset$co2)
  summary$lowest_co2_per_capita <- min(dataset$co2.per.capita, na.rm = TRUE)
  summary$highest_co2_per_capita <- max(dataset$co2.per.capita, na.rm = TRUE)
  summary$per_capita_comparison <- (max(dataset$co2.per.capita, na.rm = TRUE)) /
    (min(dataset$co2.per.capita, na.rm = TRUE))
  return(summary)
}