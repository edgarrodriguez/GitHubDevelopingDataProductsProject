
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Mine Production Prediction Model"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("numberofshovelstype1",
                  "Number of Buc Shovels:",
                  min = 1,
                  max = 5,
                  value = 2),
      sliderInput("numberofshovelstype2",
                  "Number of PyH shovels:",
                  min = 1,
                  max = 5,
                  value = 2),
      numericInput(inputId="hoursBuc", label = "Number of Hours - Buc",value = 24),
      numericInput(inputId="hoursPyH", label = "Number of Hours - PyH",value = 24),
      actionButton("goButton", "Predict Production")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      p('This model calculates Mine production considering')     ,       
      p('(Number of Shovels * Shovel productivity * Number of Production Hours)') ,
      p('Productivity average is read from productiondata.txt file') ,
      plotOutput("distProdBuc"),
      plotOutput("distProdPyH"),
      p('Number of Buc Hours'),
      textOutput('hoursBuc'),
      p('Number of PyH Hours'),
      textOutput('hoursPyH'),      
      p('Production Prediction'),
      textOutput('predictionProd')
    )
  )
))
