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
  selected = "GDP.per.capita")

y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = select_values,
  selected = "Social.support")



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
    checkboxInput("smooth", label = strong("Show Trendline"),
                  value = TRUE)
)


plot_main_content <- mainPanel(
  plotOutput("scatter"),
  p(strong("Visualization Justification:"), "This chart seeks to answer
    how the variables that make up the overall happiness score
    are related to each other. Thus, do some variables have 
    a stronger realtionship than others? Are there any
    varaibles that have a negative relationship?"),
    p(strong("Why This Chart:"), "A scatter plot was appropriate in this
    situation because it clearly allows the users to see
    the relationship of the different variables. The ability
    to add a trend line to this plot also furhter clarifies 
    and highlights the relationship between the selected
    variables.")
)


plot_panel <- tabPanel(
  "Scatter Plot",
  titlePanel("Select Scatter Plot Variables"),
  sidebarLayout(
    plot_sidebar_content,
    plot_main_content
  )
)



ui <- navbarPage(
"Group Project",
plot_panel
)

