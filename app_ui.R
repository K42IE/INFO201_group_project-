#ui

library(shiny)
library(ggplot2)
library(plotly)

gdp_range <- range(final_data$GDP.per.capita)

select_values <- colnames(plot_final_data)

x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = select_values,
  selected = "GDP.per.capita"
)

y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = select_values,
  selected = "Social.support"
)




plot_sidebar_content <- sidebarPanel(
    selectInput(
    "x_var",
    label = "X Variable",
    choices = select_values,
    selected = "GDP.per.capita"),
    selectInput(
    "y_var",
    label = "Y Variable",
    choices = select_values,
    selected = "Social.support"),
)


plot_main_content <- mainPanel(
  plotOutput("scatter")
)


plot_panel <- tabPanel(
  "Scatter Plot",
  titlePanel("Scatter"),
  sidebarLayout(
    plot_sidebar_content,
    plot_main_content
  )
)



ui <- navbarPage(
"Group Project",
plot_panel
)

