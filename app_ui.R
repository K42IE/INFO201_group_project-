#ui

library(shiny)
library(ggplot2)
library(plotly)
final_data <- read.csv("./data/final_data2.csv", stringsAsFactors = FALSE)


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
  question: Do different regions/continents have different trends when 
    comparing happiness and CO2 emissions per capita? A visulization will allow
    the user to easly see if differint graphs for differint regions/continents 
    have similar trends."),
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

# Content for the 3th page

plot_sidebar_content_pg3 <- sidebarPanel(
  selectInput(
    "y_var_pg3",
    label = "Y Variable",
    choices = list("Social Support" = "Social.support", 
                   "Healthy Life Expectancy" = "Healthy.life.expectancy",
                   "Freedom to Make Life Choices" = "Freedom.to.make.life.choices", 
                   "Generosity" = "Generosity", 
                   "Corruption Perceptions" = "Perceptions.of.corruption"),
    selected = "GDP per Capita"),
  checkboxInput("smooth", label = strong("Show Trendline"),
                value = TRUE)
)


plot_main_content_pg3 <- mainPanel(
  plotOutput("scatter_pg3"),
  p(strong("Visualization Justification:"), "This chart seeks to answer how 
    happiness score-encompassing variables relate to GDP per capita. Thus, 
    which variables have positive relationships with GDP per capita? Are there 
    variables revealing a negative relationship with GDP per capita?"),
  p(strong("Why This Chart:"), "A scatter plot is appropriate in this css as it 
    clearly allows users to observe patterns and identify correlational
    relationships between variables; and trend lines are intended to highlight 
    those correlating relationships.")
)


page_3 <- tabPanel(
  "Happiness Variables vs GDP",
  titlePanel("How do the Happiness Varables Relate to GDP?"),
  sidebarLayout(
    plot_sidebar_content_pg3,
    plot_main_content_pg3
  )
)

# Content for the 4th page
x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = list("GDP per Capita" = "GDP.per.capita", 
                 "Social Support" = "Social.support", 
                 "Healthy Life Expectancy" = "Healthy.life.expectancy",
                 "Freedom to Make Life Choices" = "Freedom.to.make.life.choices", 
                 "Generosity" = "Generosity", 
                 "Corruption Perceptions" = "Perceptions.of.corruption"),
selected = "GDP per Capita")

y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = list("GDP per Capita" = "GDP.per.capita", 
                 "Social Support" = "Social.support", 
                 "Healthy Life Expectancy" = "Healthy.life.expectancy",
                 "Freedom to Make Life Choices" = "Freedom.to.make.life.choices", 
                 "Generosity" = "Generosity", 
                 "Corruption Perceptions" = "Perceptions.of.corruption"),
selected = "Social Support")



plot_sidebar_content <- sidebarPanel(
  selectInput(
    "x_var",
    label = "X Variable",
    choices = list("GDP per Capita" = "GDP.per.capita", 
                   "Social Support" = "Social.support", 
                   "Healthy Life Expectancy" = "Healthy.life.expectancy",
                   "Freedom to Make Life Choices" = "Freedom.to.make.life.choices", 
                   "Generosity" = "Generosity", 
                   "Corruption Perceptions" = "Perceptions.of.corruption"),
    selected = "Generosity"),
  selectInput(
    "y_var",
    label = "Y Variable",
    choices = list("GDP per Capita" = "GDP.per.capita", 
                   "Social Support" = "Social.support", 
                   "Healthy Life Expectancy" = "Healthy.life.expectancy",
                   "Freedom to Make Life Choices" = "Freedom.to.make.life.choices", 
                   "Generosity" = "Generosity", 
                   "Corruption Perceptions" = "Perceptions.of.corruption"),
    selected = "GDP per Capita"),
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
  "Happiness Variables",
  titlePanel("Select Scatter Plot Variables:"),
  sidebarLayout(
    plot_sidebar_content,
    plot_main_content
  )
)

# Summary 
summary <- tabPanel(
  "Summary",
  titlePanel("Summary"),
  mainPanel(
    h3("Strong correlation between GDP per Capita and both Health Life Expectancy and Social Support."),
    img(alt = "GDPvsLifeExpImage", src = "GDP_lifeexpectancy.png", width = 480),
    img(alt = "GDPvsSocialImage", src = "GDP_socialsupport.png", width = 480),
    p("As seen in these 2 graphs, despite a few outliers, there is a strong positive correlation between GDP per capita and both the Health and Life Expectancy and Social Support scores. Altogether, this makes a lot of sense. Countries that are richer in terms of GDP per capita likely have more resources able to be dedicated to healthcare and nutrition which helps support a healthier and older population. Similarly, citizens in rich countries tend to have better access to education, retirement planning, and rehabilitation centers as the governments have more room to spend on those areas, which altogether improves the country's social scores. There is a clear trend that poorer countries are not doing enough to satisfy the health and social needs of their citizens. While it is not something they can entirely control, as they do not have enough money for every governmental sector, poorer countries need to find away to improve the health of their citizens and the social support offered to them."),
    h3("Comparison of the Happiness and CO2 relationship between Africa and Eurasia (European and Asian countries)"),
    img(alt = "AfricaTrendImage", src = "Africa_trend.png", width = 480),
    img(alt = "EurasiaTrendImage", src = "Eurasia_trend.jpg", width = 480),
    p("These two graphs show the relationship between raw happiness score and yearly average CO2 per capita data from 2018. In the first graph, which features the countries of Africa, there is not much of a correlation between happiness and CO2 emissions. Besides a few outliers, most African countries produce approximately the same amount of CO2 per capita and there is no visible trend. When looking at the second graph, which is the combined data from Asian and European countries, the first thing that stands out is that the scale is much larger in terms of both CO2 emissions and the fact the happiness scores have a higher range, median, and mean. There is also a much more defined trend, where countries with higher happiness scores use more CO2 per capita. The difference in CO2 per capita in Africa versus Eurasia is likely attributed to how much more developed countries in Eurasia are than countries that are still growing economically and socially in Africa. Eurasian countries have much more automobile traffic, large cities, and industrial factories which all contribute to the emission of CO2 that pollutes the atmosphere."),
    h3("Global Correlation between Happiness Scores and CO2 per Capita"),
    img(alt = "GlobalTrendImage", src = "Global_trend.png", width = 480),
    p("This scatter plot shows the global, positive relationship between CO2 per capita emissions and happiness scores by country in 2018. This suggests that the countries with higher happiness scores tend to produce more CO2 emissions per capita, apart from a few outliers. Through looking at our data holistically we believe that this correlation has a lot to do with GDP of the countries. We found that richer countries tend to be happier and produce more CO2 emissions as they have big cities and largescale industrial sectors. The happiest countries are those that feel most free to use CO2 as they please and that is clear from our data."),
    )
)

# code for the introduction and map
intro_df <- read.csv("data/final_data2.csv", stringsAsFactors = FALSE) %>%
  rename(NAME = Country.or.region)

# gets the colnames of the data frame to put as options in the widget
intro_col_names <- colnames(intro_df)
intro_choices <- intro_col_names[c(3:9, 13)]

# writing part

introduction <- tabPanel(
  titlePanel("Introduction"),
  mainPanel(
    p("In the 21st century, the emission of greenhouse gases worldwide has skyrocketed. According to an Our World in Data study, around 50 million metric tons of greenhouses gases are emitted each year. The most prominent of these gasses is Carbon Dioxide, commonly referred to by its chemical formula CO2. CO2 is released during industrial processes, fossil fuel combustions, and from direct human-induced impacts on forestry and other land. These emissions have polluted the atmosphere at an alarming rate, impacting the environment and our overall quality of life. We as a group are interested in the different ways our quality of life and happiness are affected by increased CO2 emissions. Recent studies have revealed that the happiest countries are those prioritizing well-being and environmental sustainability. To further explore these discoveries, our group is interested in understanding the association between CO2 emissions per capita and happiness scores by country as well as what other variables contribute to happiness."),
    p("In our report, we are tackling the following questions:"),
    tags$ol(
      tags$li("Do different regions/continents have different trends when comparing happiness and CO2 emissions per capita?"),
      tags$li("How do the variables that make up the overall happiness score relate with each other? Do some variables have noticeably strong relationships with others? Do any have weak or negative relationships? "),
      tags$li("What is the overall global trend for the relationship between happiness and CO2 emission per capita? Why does that correlation make sense?")
    ),  
    p("To answer these questions, we have created a joined dataset consisting of
    2018 happiness values on a scale of 1-10 from the World Happiness Report and
    CO2emissions from 2018 measured in millions of metric tons from 
    150 countries worldwide. In the study, happiness 
    scores range from Burundi's 2.905 to Finland's 
    7.632. On the other hand, there is an even larger range
    of CO2 emissions as the lowest country, the Central African Republic, only
    produces 0.304 million metric tons while China produces the most 
    with 1.006468610^{4} million metric tons, meaning China produces 
    3.31075210^{4} times more. However, this comparison does not 
    factor in how many more people China has than low emission countries like 
    the Central African Republic which is why our group's focus is on the CO2 
    emissions per capita data as well as the happiness values from the world 
    happiness study.")
  )
)

# other parts of intro

intro_main_one <- mainPanel(
  
  
  comparison_input <- selectInput(
    inputId = "comparison",
    label = "Choose what to compare by:",
    choices = intro_choices
  ),
  
  p("Comparison of Different Factors (darker purple = higher 
    and gray = no data for that country)"),
  leafletOutput(outputId = "map"),
  
)



intro_page_one <- tabPanel(
  
  "Introduction",
  
  titlePanel("Introduction"),
  
  introduction,
  intro_main_one
)

# rest


download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="data/world_shape_file.zip")
system("unzip data/world_shape_file.zip")

world_spdf <- readOGR( 
  dsn="world_shape_file", 
  layer="TM_WORLD_BORDERS_SIMPL-0.3",
  verbose=FALSE
)

world_spdf@data <- world_spdf@data %>%
  left_join(intro_df, by = "NAME")

# Create a color palette for the map:
mypalette <- colorNumeric( palette="viridis", domain=world_spdf@data$co2, na.color="transparent")
mypalette(c(45,43))


# ui function (combines all pages)
ui <- navbarPage(
  "Group Project",
  intro_page_one,
  page_two,
  page_3,
  plot_panel,
  summary
)
