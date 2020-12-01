library(ggplot2)
library(dplyr)
library(plotly)

# This document creates a scatter chart for our data frame for the report,
# comparing CO2 per capita and happiness score

co2_happiness_scatter <- function(df) {
  happiness_data <- df
  happinesss_plot <- ggplot(data = happiness_data) +
  geom_smooth(mapping = aes(x = Score, y = co2.per.capita),
              color = "yellow", alpha = 0.3) +
  geom_point(mapping = aes(x = Score, y = co2.per.capita),
             color = "yellow", alpha = 0.3) +
  labs(y = "CO2 Per Capita", x = "Happiness Score") +
  ggtitle("CO2 Per Capita v. Happiness Score")
  happinesss_plot_interactive <- ggplotly(happinesss_plot)
  return(happinesss_plot_interactive)
}