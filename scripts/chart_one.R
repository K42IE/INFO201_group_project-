library(ggplot2)
library(dplyr)
library(plotly)

co2_happiness_bar <- function(df) {
  lowest_co2 <- df %>%
  top_n(5, wt = -co2.per.capita)
  lowest_co2_plot <- ggplot(data = lowest_co2) + 
    geom_bar(mapping = aes(x = Country.or.region, weight = Score)) +
    labs(y = "Happiness Score", x = "Country") + 
    ggtitle("Happiness Scores for the Lowest CO2 Per Capita Countries")
  lowest_co2_plot_interactive <- ggplotly(lowest_co2_plot, tooltip = "Score")
  return(lowest_co2_plot_interactive)
}
  
  