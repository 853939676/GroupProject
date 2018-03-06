library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)


source('./function.R')

# Read dataset
pets <- read.csv("Lost__found__adoptable_pets.csv", stringsAsFactors = FALSE, sep = ",", header = TRUE, na.strings=c("","Not Available"))   
pets <- select(pets, impound_no, Animal_ID, Record_Type, Current_Location, Animal_Name, animal_type, Age, Animal_Gender,
               Animal_Breed, Animal_Color, Date, City, State, Zip)
# Define server logic required to draw a histogram/donut
shinyServer(function(input, output) {
  # diaplay the whole dataframe
   output$Table <- DT::renderDataTable({
     DT::datatable(pets , options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
   })
  
  #creat Donut chart
  output$Donut <- renderPlotly({
    return(plot(pets, "donut", input$checkGroup, input$status, input$select))
  })
  
  # create bar chart
  output$Bar <- renderPlotly({
    return(plot(pets, "bar", input$checkGroup, input$status, input$select))
  })
  
})
