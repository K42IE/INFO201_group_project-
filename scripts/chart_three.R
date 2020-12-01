make_chart_three <- function(data) {
  top_highest <- data %>%
    arrange(desc(co2.per.capita)) %>%
    tail()
  
 chart <- ggplot(top_highest, aes(x = "", y = Healthy.life.expectancy, fill = Country.or.region)) +
    geom_bar(stat = "identity", with = 1) +
    coord_polar("y", start = 0) +
   ggtitle("Healthy Life Expectanncy for Countries with the Lowest CO2 Emissions") +
   labs(y = "", x = "")
  
  return(chart)
}

