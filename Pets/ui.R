library(shiny)
library(plotly)
library(ggplot2)
library(markdown)
library(shinythemes)

# Create Navbar Page
# About, Table, Plot

ui = navbarPage("Welcome!",
           theme = shinytheme("united"),
           tabPanel("About",
           fluidRow( column(6, includeMarkdown("about.md")),
                     img(src='https://www.warrenphotographic.co.uk/photography/bigs/43460-Grey-kitten-Goldendoodle-puppy-and-fluffy-bunny-white-background.jpg',
                         align = "right",height='400px',width='600px'),
                     img(src='https://www.petplace.com/wp-content/uploads/2017/08/2862_sm.jpg', 
                         align = "right",height='262px',width='643px')
           )),
  
  tabPanel("Table",
          img(src='https://www.warrenphotographic.co.uk/photography/bigs/41334-Animal-line-up-white-background.jpg',
              align = "left", height ='300px', width ='850px'),
          DT::dataTableOutput("Table")
           ),
  
  tabPanel("Plot",
    (sidebarLayout(
      sidebarPanel( width = 3,
                    
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
      # Create tabs for page
      mainPanel( width = 9,
        tabsetPanel(
          type = "tabs",
          tabPanel("Donut Chart", plotlyOutput("Donut")),
          tabPanel("Bar Chart", plotlyOutput("Bar"))
          )
        )
      )
     ),
    img(src = 'http://www.petlandrome.com/wp-content/uploads/1970/01/petland_contactus-1200x327.jpg',
        align = 'right', height = '327px', width = '1200px')
  )
)


    
    
    
    