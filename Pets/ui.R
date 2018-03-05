library(shiny)
library(plotly)
library(ggplot2)
library(markdown)

# Create Navbar Page
# About, Table, Plot
navbarPage("Welcome!",
  tabPanel("About",
           fluidRow(column(6, includeMarkdown("about.md"))
                    )
           ),
  
  tabPanel("Table",
           DT::dataTableOutput("Table")
           ),
  
  tabPanel("Plot",
    (sidebarLayout(
      sidebarPanel(
        ## create checkbox menu for dog cat etc
        checkboxGroupInput("checkGroup", label = h3("Check One or More Type of Pets"),
                           choices = list("Dog" = "Dog", "Cat" = "Cat", "Other" = "Other"),
                           selected = "Dog"
                           ),
        
        selectInput("status", label = h3("Select Status of Pets"), 
                    choices = list("Adoptable" = "A", "Lost" = "L", "Found" = "F"),
                    selected = "A"
                    ),
        
        selectInput("select", label = h3("Display plot by:"),
                    choices = list("Gender" = "G", "Breed" = "B")
                    )
        ),
      
      # Show a plot of the generated distribution
      mainPanel(# Create tabs for page
        tabsetPanel(
          type = "tabs",
          tabPanel("Donut Chart", plotlyOutput("Donut")),
          tabPanel("Bar Chart", plotlyOutput("Bar"))
          )
        )
      )
     )
  )
)

    
    
    
    