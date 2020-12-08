#server

library(plotly)
library(ggplot2)

final_data <- read.csv("./data/final_data.csv", stringsAsFactors = FALSE)


plot_final_data <- final_data %>%
  select("GDP.per.capita", "Social.support",
         "Healthy.life.expectancy", 
         "Freedom.to.make.life.choices",
         "Generosity",
         "Perceptions.of.corruption")

server <- function(input, output) {
  output$scatter <- renderPlot({
    
    title <- paste0("Scatter Plot: ", input$x_var, " v. ", input$y_var)
    
    
    plot <- ggplot(data = plot_final_data) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var)) +
      labs(x = input$x_var, y = input$y_var, title = title)
    
    if (input$smooth) {
      plot <- plot + geom_smooth(mapping = 
                                   aes_string(x = input$x_var, y = input$y_var))
    }
    
    plot
    
  })
}
