
library(dplyr)
library(ggplot2)
library(readr)
df <- read_csv("country_vaccinations.csv.zip")
countries <- df %>% distinct(country)

fluidPage(
        titlePanel("Covid Vaccines by Country by Maria Freydlin"),
        h4("Instructions:"),
        h5("Please select a country from the dropdown list below to view the timeline of total vaccines administered within the last few months."),
        titlePanel("Vaccine Timeline by Country"),   
        
        sidebarLayout(
                sidebarPanel(
                        selectInput( "country", "Country:", choices=countries),
                        hr()
                        
                ),
                mainPanel(
                        plotOutput("vaccinePlot")
                )
        )
)