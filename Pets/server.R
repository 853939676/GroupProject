library(shiny)


shinyServer(function(input, output) {
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
})
