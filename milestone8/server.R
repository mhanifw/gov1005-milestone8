#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(janitor)
library(fs)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Make objects
    
    energyuse <-
        read_csv(file = "cambridge_energy_use.csv",
                 col_types = cols(
                     .default = col_double(),
                     `Building ID` = col_character(),
                     MapLot = col_character(),
                     `Annual Report Received` = col_character(),
                     `Report Type` = col_character(),
                     `Buildings Included` = col_character(),
                     `Parent Building ID` = col_logical(),
                     `Assessor Address` = col_character(),
                     `Address Point GIS` = col_character(),
                     `Property Type` = col_character(),
                     `Primary Property Type - Self Selected` = col_character(),
                     Grantee = col_character(),
                     Co_grantee = col_character(),
                     `Fuel Oil #1 Use (kBtu)` = col_logical(),
                     `Fuel Oil #5 & 6 Use (kBtu)` = col_logical()
                 )) %>%
        clean_names()
    
    

    output$energyplot <- renderPlot({
        
        # Pull input from ui
        
        slider <- input$value
        bins <- input$select
        
        # Simple histogram plot of year built
       
        energyuse %>%
            filter(year_built < slider) %>%
            ggplot(aes(x = year_built)) +
            geom_histogram()

    })

})
