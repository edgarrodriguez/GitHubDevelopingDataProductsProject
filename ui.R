
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
      sliderInput("trucks",
                  "Number of trucks:",
                  min = 1,
                  max = 120,
                  value = 30),
      sliderInput("shovels",
                  "Number of shovels:",
                  min = 1,
                  max = 10,
                  value = 4),
      textInput(inputId="text1", label = "Input Text1"),
      textInput(inputId="text2", label = "Input Text2"),
      actionButton("goButton", "Predict Production")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distTrucks"),
      plotOutput("distShovels"),
      p('Output text1'),
      textOutput('text1'),
      p('Output text2'),
      textOutput('text2'),
      p('Output text3'),
      textOutput('text3')
    )
  )
))
