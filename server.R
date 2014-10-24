library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$text1 <- renderText({paste("Mean:", input$mean1)})
  output$text2 <- renderText({paste("SD:", input$sd1)})

  output$distPlot1 <- renderPlot({
    norm1 <- rnorm(input$ntrials, input$mean1, input$sd1)
    snorm1 <<- sample(norm1)
    #cat("snorm1 = ", snorm1[1:5], "\n")
    mean1 <<- input$mean1
    sd1 <<- input$sd1
    text(63, 150, paste("Mean = ",input$mean1))
    text(63, 140, paste("SD = ", sd1))
    hist(norm1, freq=FALSE, breaks = 30, col = 'yellow', border = 'black', main="Equivalence Ratio (Phi) Distribution", xlab="Equivalence Ratio")
    curve(dnorm(x, mean1, sd1), add=TRUE, col="darkblue", lwd=2)

  })

  output$text3 <- renderText({paste("Mean:", input$mean2)})
  output$text4 <- renderText({paste("SD:", input$sd2)})
  output$distPlot2 <- renderPlot({
    norm2 <- rnorm(input$ntrials, input$mean2, input$sd2)
    snorm2 <<- sample(norm2)
    #cat("snorm2 = ", snorm2[1:5], "\n")
    mean2 <<- input$mean2
    sd2 <<- input$sd2
    hist(norm2, freq=FALSE, breaks = 30, col = 'blue', border = 'black', main="Oxygen Sensor Precision", xlab="Oxygen Sensor Measurement Error")
    curve(dnorm(x, mean2, sd2), add=TRUE, col="darkblue", lwd=2)
    
  })
  
  output$distPlot3 <- renderPlot({
    input$action
    sum12 <- snorm1 + (snorm1*snorm2)
    #reactive({mean12 <<- mean(sum12)})
    #reactive({sd12 <<- sd(sum12)})
    mean12 <<- mean(sum12)
    sd12 <<- sd(sum12)
    #cat("mean12 = ", mean12, "\n")
    #cat("snorm1 = ", snorm1[1:5], "\n")
    hist(sum12, freq=FALSE, breaks = 30, col = 'red', border = 'black', main="Bulk Phi Statistical Model", xlab="Bulk Phi")
    curve(dnorm(x, mean12, sd12), add=TRUE, col="darkblue", lwd=2)
    
  })
  output$text5 <- renderText({
    input$action
    paste("Mean:", mean12)
  })
  
  output$text6 <- renderText({
    input$action
    paste("SD:", sd12)
  })
  
})