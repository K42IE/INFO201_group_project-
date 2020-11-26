# This document creates a data frame of summarized data that we will
# use in our project. 
#
# If you need help determining the name meanings here is a code book for 
# the CO2 data set:
# https://github.com/owid/co2-data/blob/master/owid-co2-codebook.csv
library(dplyr)

happyness_data <- read.csv("data/happiness/2018.csv", stringsAsFactors = FALSE)
co2_data <- read.csv("data/owid-co2-data.csv", stringsAsFactors = FALSE)

# filtering co2_data to contain only information we need
edit_co2_data <- co2_data %>%
  filter(year == 2018) %>%
  select(country, co2, cumulative_co2, population) %>%
  rename(Country.or.region = country)

# Joining edit_co2_data and happyness_data by country (inner join)
final_data <- inner_join(happyness_data, edit_co2_data, by = 'Country.or.region')

# Saving final_data to data folder for this project
write.csv(final_data, "data/final_data.csv", row.names = FALSE)
