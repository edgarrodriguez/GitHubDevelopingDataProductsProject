
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

# read csv with productivity of shovel type by month
df = read.csv("productiondata.txt", header = TRUE)

# get the average of productivity for each type of shovel
meanBuc <- mean (df[,3])
meanPyH <- mean (df[,4])


shinyServer(function(input, output) {

  output$distProdBuc <- renderPlot({

    # reads productivity for shovel type 1
    ProductivityShovelBuc    <- df[, 3]

    # draw the histogram of productivity for shovel type 1
    hist(ProductivityShovelBuc, breaks = 10, col = 'darkgray', border = 'white')

  })

  output$distProdPyH <- renderPlot({

    # reads productivity for shovel type 2
    ProductivityShovelPyH    <- df[, 4]
          
    # draw the histogram of productivity for shovel type 2
    hist(ProductivityShovelPyH, breaks = 10, col = 'darkgray', border = 'white')
  
   })
  
  output$hoursBuc <- renderText({input$hoursBuc})
  output$hoursPyH <- renderText({input$hoursPyH})
  
  output$predictionProd <- renderText({
                  input$goButton
                  isolate((input$hoursBuc * meanBuc * input$numberofshovelstype1 + input$hoursPyH * meanPyH * input$numberofshovelstype2))
                  
   })
                                 
  
})
