library(shiny)

my.ui <- fluidPage(
shinyUI(fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(

       ## create checkbox menu for dog cat etc
      # Copy the chunk below to make a group of checkboxes
      checkboxGroupInput("checkGroup", label = h3("Check One or More Type of Pets"), 
                         choices = list("Dog" = 1, "Cat" = 2, "Other" = 3),
                         selected = 1),
      
      
      hr()
    ),
    
    selectInput("select", label = h3("Display plot by:"), 
                choices = list("Gender" = 1, "Breed" = 2)
    )),
    
    # Show a plot of the generated distribution
    mainPanel(
     
    # Create tabs for page   
       tabsetPanel(type = "tabs",
                   tabPanel("Lost", plotlyOutput("Lost")),
                   tabPanel("Found", plotlyOutput("Found")),
                   tabPanel("Adoptable", plotlyOutput("Adoptable"))
       )
    )
  )
)
)

shinyUI(my.ui)