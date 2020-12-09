#ui

library(shiny)
library(ggplot2)
library(plotly)


# Content for the 2nd page
page_two_side <- sidebarPanel(
  h2("Choose the Region(s) You Want to Display"),
  checkboxGroupInput(inputId = "checkRegion", label = h3("Regions:"), 
                     choices = list("Africa", "Americas", "Asia", "Europe", 
                                "Oceania", "Russia"),
                     selected = NULL)
)

page_two_main <- mainPanel(
  plotlyOutput(
    outputId = "co2HappinessPlot"
  ),
  p(strong("Visualization Justification:"), "This chart seeks to answer the 
  question: Do differint regions/continents have differint trends when 
    comparing happiness and CO2 emmisions per capita? A visulation will allow
    the user to easly see if differint graphs for differint regions/continents 
    have simmular trends."),
  p(strong("Why This Chart:"), "A scatter plot was appropriate in this
    situation because it clearly allows the users to see
    the relationship of the different variables. Having the option for the user 
    to select multaple continents allows them to better explore how trends 
    change with regions/continents.")
)

page_two <- tabPanel(
  "CO2 vs Happiness Trends",
  titlePanel("How Do CO2 vs Happiness Trends Differ per Region?"),
  sidebarLayout(
    page_two_side,
    page_two_main
  )
)

# Content for the 4th page
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


# ui function (combines all pages)
ui <- navbarPage(
"Group Project",
page_two,
plot_panel
)

