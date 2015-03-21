
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distTrucks <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    trucks <- seq(min(x), max(x), length.out = input$trucks + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = trucks, col = 'darkgray', border = 'white')

  })

  output$distShovels <- renderPlot({
          
          # generate bins based on input$bins from ui.R
          x    <- faithful[, 2]
          shovels <- seq(min(x), max(x), length.out = input$shovels + 1)
          
          # draw the histogram with the specified number of bins
          hist(x, breaks = shovels, col = 'darkgray', border = 'white')
  
                                })
  
          output$text1 <- renderText({input$text1})
          output$text2 <- renderText({input$text2})
  
          output$text3 <- renderText({
                  input$goButton
                  isolate(paste(input$text1, input$text2))
                  
                                 })
                                 
  
})
