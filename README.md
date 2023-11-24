# STAT 545B Assignment B3: Shiny App Development
## Country Economical Growth Metrics 1952-2007

### Description  
This repository contains the files and code authored by Renessa Gomes as submission for **STAT 545B Assignment B3**. This submission was completed according to the guidelines and requirements found [**here**](https://stat545.stat.ubc.ca/assignments/assignment-b3/). 

The purpose of **Assignment B3** is to create and deploy a Shiny app containing at least three unique features. 

The data set selected for this Shiny app is the `gapminder` data set found in the `gapminder` [package](https://cran.r-project.org/web/packages/gapminder/index.html).

### App Functionality  
This app, titled "**Country Economical Growth Metrics 1952-2007**" allows the user to select a _country_ and _year range_ to filter the `gapminder` data set by. The app then outputs three graphs visualizing the trend of **life expectancy**, **population** and **GDP per capita** for the given country over the given time range. The graphs are plotted using a _color_ of the user's choosing for additional customization of the data visualization. 

The current running version of this Shiny app can be found [**here**](https://renessag.shinyapps.io/Country-Economical-Growth-Metrics-1952-2007/).

### Files in the Repository  
This repository contains the following files:  
* `README.md` : Shiny app introduction and guide to this repository
* `app.R` : code used to develop this Shiny app

### Running the Code  
The following packages are required to run the code in `app.R` and may need to be installed:  
* `shiny` : contains functions required for Shiny app development 
* `colourpicker` : contains `colourInput` for user-defined colour section input in Shiny apps  
* `gapminder` : contains the data set used for this Shiny app
* `dplyr` : contains functions required for data filtering
* `ggplot2` : contains functions required for data visualization

