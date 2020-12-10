library(dplyr)
library(plotly)

buildScatter <- function(df, region) {
  refined_df <- filter(df, continent %in% region)
  
    plot <- plot_ly(
      data = refined_df,
      x = ~Score,
      y = ~co2.per.capita,
      type = "scatter",
      mode = "markers"
    ) %>%
    layout(
        title = "Happiness Score vs CO2 per Capita",
        xaxis = list(title = "Happiness Score"),
        yaxis = list(title = "CO2 per Capita")
      )
    return(plot)
}