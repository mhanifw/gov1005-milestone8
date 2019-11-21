#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)

# Define navbarPage
navbarPage("Project Title",
           #Tab 1: About
           tabPanel("About",
                    #Dynamic row for text
                    fluidRow(
                        column(6,
                               #Include about.md text file
                               includeMarkdown("about.md")
                        ),
                        #Dynamic row spacing
                        column(3
                        )
                    )
           ),
           #Tab 2: Plot
           tabPanel("First section",
                    tabsetPanel(
                        # Output panel for slider
                        tabPanel(
                            sliderInput("value",
                                        h3("Year built"),
                                        min = 1700,
                                        max = 2019,
                                        value = 2000)),
                        tabPanel(
                            selectInput("select", h3("Number of bins"), 
                                        choices = list("Choice 1" = 1, "Choice 2" = 2,
                                                       "Choice 3" = 3), selected = 1)),
                        # Output panel for plot
                        mainPanel(
                            plotOutput("energyplot")))
                    ),
           tabPanel("Second section",
                    #Output panel for Maps
                    mainPanel(
                        
                    )
           )
)
