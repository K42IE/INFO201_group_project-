library(ggplot2)
library(dplyr)
library(plotly)


co2_happiness_scatter <- function(df) {
  happiness_data <- df
  happinesss_plot <- ggplot(data = happiness_data) + 
  geom_smooth(mapping = aes(x = Score, y = co2.per.capita), color = "yellow", alpha = 0.3) +
  geom_point(mapping = aes(x = Score, y = co2.per.capita), color = "yellow", alpha = 0.3) +
  labs(y = "CO2 Per Capita", x = "Happiness Score") + 
  ggtitle("CO2 Per Capita v. Happiness Score")
  happinesss_plot_interactive <- ggplotly(happinesss_plot)
  return(happinesss_plot_interactive)
}


#scatter plots by happiness variable:

life_plot <- ggplot(data = df) + 
  geom_point(mapping = aes(x = Healthy.life.expectancy, y = co2.per.capita), color = "red", alpha = 0.3) +
  geom_smooth(mapping = aes(x = Healthy.life.expectancy, y = co2.per.capita), color = "red", alpha = 0.3) +
  labs(y = "CO2 Per Capita", x = "Life Expectancy") + 
  ggtitle("CO2 Per Capita v. Life Expectancy")
  
social_plot <- ggplot(data = df) +   
  geom_point(mapping = aes(x = Social.support, y = co2.per.capita), color = "blue", alpha = 0.3) +
  geom_smooth(mapping = aes(x = Social.support, y = co2.per.capita), color = "blue", alpha = 0.3) +
  labs(y = "CO2", x = "Social Support") + 
  ggtitle("CO2 v. Social Support")
  
freedom_plot <- ggplot(data = df) +   
  geom_point(mapping = aes(x = Freedom.to.make.life.choices, y = co2.per.capita), color = "green", alpha = 0.3) +
  geom_smooth(mapping = aes(x = Freedom.to.make.life.choices, y = co2.per.capita), color = "green", alpha = 0.3) +
  labs(y = "CO2", x = "Freedom to Make Life Choices") + 
  ggtitle("CO2 v. Freedom to Make Life Choices")
  
corruption_plot <- ggplot(data = df) +  
  geom_point(mapping = aes(x = Perceptions.of.corruption, y = co2.per.capita), color = "purple", alpha = 0.3) +
  geom_smooth(mapping = aes(x = Perceptions.of.corruption, y = co2.per.capita), color = "purple", alpha = 0.3) +
  labs(y = "CO2", x = "Perceptions of Corruption") + 
  ggtitle("CO2 v. Perceptions of Corruption")
  
gdp_plot <- ggplot(data = df) +  
  geom_point(mapping = aes(x = GDP.per.capita, y = co2.per.capita), color = "violet", alpha = 0.3) +
  geom_smooth(mapping = aes(x = GDP.per.capita, y = co2.per.capita), color = "violet", alpha = 0.3) +
  labs(y = "CO2", x = "GDP per Capita") + 
  ggtitle("CO2 v. GDP per Capita")
  
generosity_plot <- ggplot(data = df) +   
  geom_point(mapping = aes(x = Generosity, y = co2.per.capita), color = "orange", alpha = 0.3) +
  geom_smooth(mapping = aes(x = Generosity, y = co2.per.capita), color = "orange", alpha = 0.3) +
  labs(y = "CO2", x = "Generosity") + 
  ggtitle("CO2 v. Gnerosity")

