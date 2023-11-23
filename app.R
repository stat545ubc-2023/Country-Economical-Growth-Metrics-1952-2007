library(shiny) # Required for app production
library(colourpicker) # Provided colour selection input functionality
library(gapminder) # Dataset 
library(dplyr) # Contains functions for filtering data set 
library(ggplot2) # Contains data functions for data visualization 

ui <- fluidPage(
  titlePanel("Country Economical Growth Metrics From 1952-2007"),
  sidebarLayout(
    sidebarPanel(
      "Filter data by country and period of interest below:",
      
      # Feature 1 : Drop-down menu of countries to filter data set by, allowing user-control of their country of interest
      selectInput("country", "Country", choices = unique(gapminder$country), selected = "Canada"),
      
      # Feature 2 : Slider of year range to filter data set by, allowing user-control of time range of interest
      sliderInput("year", "Year", min = 1952, max = 2007, value = c(1952, 2007), step = 5, sep = ""),
      
      # Feature 3 : Color-picker to allow customization of output graphs, should user want to copy graph for external use
      colourInput("col", "Select Colour", value = "#38AAACFF")
    ),
    
    mainPanel(
      "Life Expectancy, Population and GDP Per Capita",
      plotOutput("lifeExp"),
      plotOutput("pop"),
      plotOutput("gdpPercap")
    )
  )
)

server <- function(input, output) {
  
  # Filtering the gapminder dataset according to user-defined inputs for country and time range
  filtered <- reactive({
    gapminder %>%
    filter(country == input$country,
           year >= input$year[1],
           year <= input$year[2])
  })
  
  # Output 1 graphing Life Expectancy over defined time range for selected country
  output$lifeExp <- renderPlot({
    ggplot(filtered(), aes(year, lifeExp)) +
      geom_line(colour = input$col) +
      labs(x = "Year", y = "Life Expectancy") +
      theme_minimal()
  })
  
  # Output 2 graphing Population over defined time range for selected country
  output$pop <- renderPlot({
    ggplot(filtered(), aes(year, pop)) +
      geom_line(colour = input$col) +
      labs(x = "Year", y = "Population") +
      theme_minimal()
  })
  
  # Output 3 graphing GDP per Capita over defined time range for selected country
  output$gdpPercap <- renderPlot({
    ggplot(filtered(), aes(year, gdpPercap)) +
      geom_line(colour = input$col) +
      labs(x = "Year", y = "GDP per Capita ($)") +
      theme_minimal()
  })
  
}

shinyApp(ui = ui, server = server)