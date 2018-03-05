library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)

source('./function.R')

# Read dataset
pets <- read.csv("Lost__found__adoptable_pets.csv", stringsAsFactors = FALSE, sep = ",", header = TRUE)

# Define server logic required to draw a histogram/donut
shinyServer(function(input, output) {
  
  #creat Donut chart
  output$Donut <- renderPlotly({
    return(plot(pets, "donut", input$checkGroup, input$status, input$select))
  })
  
  # create bar chart
  output$Bar <- renderPlotly({
    return(plot(pets, "bar", input$checkGroup, input$status, input$select))
  })
  
  output$Table <- DT::renderDataTable({
    DT::datatable(pets, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
  })
  
})
