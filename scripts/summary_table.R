# This document creates a summary table showing information about countries' 
# happiness score and CO2 emissions per capita
make_summary_table <- function(data) {
  # Adding a column of happiness score rounding to a whole number 
  data$whole_happyness_score <- round(data$Score, digits = 0)
  # Creates table
  summary_table <- data %>%
    group_by(whole_happyness_score) %>%
    summarise(mean_co2_per_capita = mean(co2.per.capita, na.rm=TRUE), 
              min_co2_per_capita = min(co2.per.capita, na.rm=TRUE), 
              max_co2_per_capita = max(co2.per.capita, na.rm=TRUE))
  return(summary_table)
}

