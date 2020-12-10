#server

library(plotly)
library(ggplot2)
library(dplyr)

source("./buildScatter.R")

final_data <- read.csv("./data/final_data2.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  # for page 1
  output$map <- renderLeaflet({
    leaflet(world_spdf) %>% 
      addTiles()  %>% 
      setView( lat=10, lng=0 , zoom=2) %>%
      addPolygons(stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, 
                  color = ~colorNumeric(palette = "Purples", 
                  world_spdf@data[, input$comparison])(world_spdf@data[, 
                  input$comparison]) )
  })
  
  # for page 2
  output$co2HappinessPlot <- renderPlotly({
    return(buildScatter(final_data, input$checkRegion))
  })
  
  # For page 3
  output$scatter_pg3 <- renderPlot({
    
    title <- paste0("Scatter Plot: ", input$x_var, " v. ", input$y_var)
    
    
    plot <- ggplot(data = final_data) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var)) +
      labs(x = input$x_var, y = input$y_var, title = title)
    
    if (input$smooth) {
      plot <- plot + geom_smooth(mapping = 
                                   aes_string(x = input$x_var, y = input$y_var))
    }
    
    plot
    
  })
  
  # For page 4
  output$scatter <- renderPlot({
    
    title <- paste0("Scatter Plot: ", input$x_var, " v. ", input$y_var)
    
    
    plot <- ggplot(data = final_data) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var)) +
      labs(x = input$x_var, y = input$y_var, title = title)
    
    if (input$smooth) {
      plot <- plot + geom_smooth(mapping = 
                                   aes_string(x = input$x_var, y = input$y_var))
    }
    
    plot
    
  })
}
