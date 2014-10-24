library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Simulation of Equivalence Ratio Control Capability"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
    numericInput("ntrials", 
                   label = h6("Number of Trials:"),
                   50000, min = 10000, max = 100000, step = 5000),
  
    br(),  
    br(),
    br(),
    sliderInput("mean1",
                label = h6("Mean of Phi distribution:"),
                  min = 0.97,
                  max = 1.03,
                  value = 1.01),
      
    sliderInput("sd1",
                label = h6("SD of Phi distribution:"),
                min = 0.0115,
                max = 0.0135,
                value = 0.0125),
    br(),
    br(),
    br(),
    sliderInput("mean2",
                label = h6("Mean of Oxygen Sensor Measurement Error distribution:"),
                min = -0.01,
                max = 0.01,
                value = 0.0),
    
    sliderInput("sd2",
                label = h6("SD of Oxygen Sensor Measurement Error distribution:"),
                min = 0.0075,
                max = 0.0125,
                value = 0.01),
    
           br(),
           br(),
           br(),
    h6("Simulate Bulk Phi"),
    actionButton("action", label = "Bulk Phi")
  ),
      
    # Show plots of the generated distribution
    mainPanel(
      textOutput('text1'),
      textOutput('text2'),
      plotOutput("distPlot1"),
      textOutput('text3'),
      textOutput('text4'),
      plotOutput("distPlot2"),
      textOutput('text5'),
      textOutput('text6'),
      plotOutput("distPlot3")
    )
  )
))