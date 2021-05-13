
library(dplyr)
library(ggplot2)
library(readr)
df <- read_csv("country_vaccinations.csv.zip")

function(input, output){
        df_total <- reactive({
                df %>%
                        filter(country==input$country)%>%
                        group_by(date) %>%
                        summarise(total = sum(total_vaccinations, na.rm = T))
        })
        
        output$vaccinePlot <- renderPlot({
                ggplot(df_total(), aes(date, total)) + geom_line() +theme_bw()
        })
}