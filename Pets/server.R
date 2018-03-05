library(shiny)
library(plotly)
pets <- read.csv("Lost__found__adoptable_pets.csv", sep = ",", header = TRUE)

# Define server logic required to draw a histogram/donut
my.server <- function(input, output) {
  
  # You can access the values of the widget
  # with input$checkGroup, e.g.
  output$value <- renderPrint({ input$checkGroup })
 
  # Generate data for LOST ONLY ----
 
  output$Lost <- renderPlotly({
   lost_pets <- pets %>% filter(Record_Type == "LOST")
  
   })
  
  # Generate data for FOUND ONLY ----
  output$Found <- renderPlotly({
   found_pets <- pets %>%  filter(Record_Type == "FOUND")
  
   })
  
  # Generate data for ADOPTABLE ONLY ----
  output$Adoptable <- renderPlotly({
   adoptable_pets <- pets %>% filter(Record_Type == "ADOPTABLE")
  
   })
  
  output$value <- renderPrint({  # change renderPrint to renderPlot
    if(input$select == 1) {
      print("this should plot by gender")
      # add in plot function for GENDER
      
    } else if(input$select == 2) {
      print("this should plot by breed")
      # add in plot function for BREED
      
    } else {
      print("")
      # plot something random or first plot (because it will prob never get used)
    }
    
  })
  
}

shinyServer(my.server)



