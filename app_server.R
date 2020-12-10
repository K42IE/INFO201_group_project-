# server

library(plotly)
library(ggplot2)
library(dplyr)
library(rsconnect)

source("./buildScatter.R")

server <- function(input, output) {
  
  output$map <- renderLeaflet({
    leaflet(world_spdf) %>%
      addTiles() %>%
      setView(lat = 10, lng = 0, zoom = 2) %>%
      addPolygons(
        stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5,
        color = ~ colorNumeric(
          palette = "Purples",
          world_spdf@data[, input$comparison]
        )(world_spdf@data[
          ,
          input$comparison
        ])
      )
  })
  
  ## For page 2
  output$co2_happiness_plot <- renderPlotly({
    return(build_scatter(final_data, input$checkRegion))
  })
  
  # For page 3
  
  # create scatter plot output
  output$scatter_pg3 <- renderPlot({
    # create title using y user input
    title <- paste0("Scatter Plot: ", "CO2 per Capita", " v. ", input$y_var_pg3)
    
    # plot data using ggplot
    plot <- ggplot(data = final_data, ) +
      # created trend line
      geom_point(mapping = aes_string(
        x = final_data$co2.per.capita,
        y = input$y_var_pg3
      )) +
      labs(x = "CO2 per Capita", y = input$y_var_pg3, title = title)
    
    ggplotly(plot)
    # add statement to include trend box option for user
    
    if (input$smooth) {
      plot <- plot + geom_smooth(
        mapping =
          aes_string(
            x = final_data$co2.per.capita,
            y = input$y_var_pg3
          )
      )
    }
    
    
    plot
  })
  
  output$hover_info <- renderPrint({
    cat("input$plot_hover:\n")
    x <- input$plot_hover$coords_css$x
    y <- input$plot_hover$coords_css$y
    str(paste("(", x, ",", y, ")"))
  })
  
  
  # For page 4
  
  # create scatter plot output
  
  output$scatter <- renderPlot({
    # create title using y user input
    title <- paste0("Scatter Plot: ", input$x_var, " v. ", input$y_var)
    
    # plot data using ggplot
    plot <- ggplot(data = final_data) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var)) +
      labs(x = input$x_var, y = input$y_var, title = title)
    # add statement to include trend box option for user
    if (input$smooth) {
      plot <- plot + geom_smooth(
        mapping =
          aes_string(x = input$x_var, y = input$y_var)
      )
    }
    
    plot
  })
  
  output$hover_info_p4 <- renderPrint({
    cat("input$plot_hover_p4:\n")
    x <- input$plot_hover_p4$coords_css$x
    y <- input$plot_hover_p4$coords_css$y
    str(paste("(", x, ",", y, ")"))
  })
}