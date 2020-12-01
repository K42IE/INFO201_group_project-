library(ggplot2)
library(dplyr)

# Creates pi chart of the top 6 countries with the lowest CO2 emissions per
# capita comparing healthy life expectancy

make_chart_three <- function(data) {
  # Narrows down data frame to the countries with the least amount of CO2
  # emission per capita
  top_highest <- data %>%
    arrange(desc(co2.per.capita)) %>%
    tail()

  # Creates pi chart
  chart <- ggplot(top_highest, aes(
    x = "", y = Healthy.life.expectancy,
    fill = Country.or.region
  )) +
    geom_bar(stat = "identity", with = 1) +
    coord_polar("y", start = 0) +
    ggtitle("Healthy Life Expectancy (Countries with Lowest CO2 Emissions)") +
    labs(y = "", x = "")
}