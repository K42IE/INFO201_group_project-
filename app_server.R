#server

library(plotly)
library(ggplot2)
library(dplyr)

source("./buildScatter.R")

#read in data frame
final_data <- read.csv("./data/final_data2.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  # for page 1
 
  # code for the introduction and map
  intro_df <- read.csv("data/final_data2.csv", stringsAsFactors = FALSE) %>%
    rename(NAME = Country.or.region)
  
  
  
  # gets the colnames of the data frame to put as options in the widget
  intro_col_names <- colnames(intro_df)
  intro_choices <- intro_col_names[c(3:9, 13)]
  
  
  
  # rest
  world_spdf <- readOGR( 
    dsn="world_shape_file", 
    layer="TM_WORLD_BORDERS_SIMPL-0.3",
    verbose=FALSE
  )
  
  
  
  world_spdf@data <- world_spdf@data %>%
    left_join(intro_df, by = "NAME")
  
  
  
  # Create a color palette for the map:
  mypalette <- colorNumeric( palette="viridis", domain=world_spdf@data$co2, 
                             na.color="transparent")
  mypalette(c(45,43))
  
  

  output$map <- renderLeaflet({
    leaflet(world_spdf) %>% 
      addTiles()  %>% 
      setView( lat=10, lng=0 , zoom=2) %>%
      addPolygons(stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, 
                  color = ~colorNumeric(palette = "Purples", 
                  world_spdf@data[, input$comparison])(world_spdf@data[, 
                  input$comparison]) )
  })
  
  ## For page 2
  output$co2HappinessPlot <- renderPlotly({
    return(buildScatter(final_data, input$checkRegion))
  })

  # For page 3
  
  #create scatter plot output
  output$scatter_pg3 <- renderPlot({
    #create title using y user input
    title <- paste0("Scatter Plot: ", "CO2 per Capita", " v. ", input$y_var_pg3)
    
    #plot data using ggplot
    plot <- ggplot(data = final_data) +

      geom_point(mapping = aes_string(x = final_data$GDP.per.capita, y = input$y_var_pg3)) +
      labs(x = final_data$GDP.per.capita, y = input$y_var_pg3, title = title)
    
    # created trend line
      geom_point(mapping = aes_string(x = final_data$co2.per.capita, y = input$y_var_pg3)) +
      labs(x = "CO2 per Capita", y = input$y_var_pg3, title = title)
    


      geom_point(mapping = aes_string(x = final_data$co2.per.capita, 
                                      y = input$y_var_pg3)) +
      labs(x = "CO2 per Capita", y = input$y_var_pg3, title = title)
    #add statement to include trend box option for user

    if (input$smooth) {
      plot <- plot + geom_smooth(mapping = 
                                   aes_string(x = final_data$co2.per.capita, 
                                              y = input$y_var_pg3))
    }
    
    plot
    
  })
  

  # For page 4
  
  #create scatter plot output

  output$scatter <- renderPlot({
    #create title using y user input
    title <- paste0("Scatter Plot: ", input$x_var, " v. ", input$y_var)
    
    #plot data using ggplot
    plot <- ggplot(data = final_data) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var)) +
      labs(x = input$x_var, y = input$y_var, title = title)
    #add statement to include trend box option for user
    if (input$smooth) {
      plot <- plot + geom_smooth(mapping = 
                                   aes_string(x = input$x_var, y = input$y_var))
    }
    
    plot
    
  })
}
