library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("name of panel"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("select", label = h3("Display plot by:"), 
                  choices = list("Gender" = 1, "Breed" = 2)
                  )),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("value") # change textOutput to plotOutput("distPlot")
    )
  )
))
