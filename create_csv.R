data <- read.csv("data/countryContinent 2.csv", stringsAsFactors = FALSE)
View(data)

final_data <- read.csv("data/final_data.csv", stringsAsFactors = FALSE)

library("dplyr")

data <- select(data, 
       country, 
       continent)

colnames(data)[1] = "Country.or.region"
data <- unique(data)

data[236, "Country.or.region" ] <- "United States"
data[235, "Country.or.region"] <- "United Kingdom"

final_data2 <- left_join(final_data, data, by = "Country.or.region")
View(final_data2)

final_data2[26, "continent"] <- "Asia"

write.csv(final_data2, "data/final_data2.csv", row.names = FALSE)
