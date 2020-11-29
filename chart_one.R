df <- read.csv("data/final_data.csv", stringsAsFactors = FALSE)
library(plotly)

What it attempts to seeks to express: 

  What are the happiness scores of the 5 countries with 
  the lowest CO2 per Capita in 2018? 


What information it reveals: 
  
  The happiness scores for the 5 countries with the lowest CO2 per Capita 
  are 2.9 (Burundi), 3 (Central African Republic), 4.3 (Chad), 3.6 (Malwai), 
  and Somalia (5). This is interesting because the happiness scores of these 
  countries are in the bottom and middle of the range of happiness scores, thus
  the top five lowest CO2 per Capita countries are not countries with the highest
  happiness scores.
    
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
  
  
co2_happiness_bar(df)
