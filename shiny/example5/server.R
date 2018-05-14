shinyServer(function(input, output) {

  data <- reactive({
     rnorm(input$n)  
  })

  summaries <- reactive({
     x <- data()
     list(n=length(x), xbar=round(mean(x), 3), shat=round(sd(x), 3))
  })

  output$plot1 <- renderPlot({
    bw <- diff(range(data()))/as.numeric(input$nbins)
    ggplot(data.frame(x=data()), aes(x)) +
    geom_histogram(color = "black", fill = "white", binwidth = bw) + 
    labs(x="x", y="Counts")
  })
  
  output$plot2 <- renderPlot({
    x <- data()
    df <- data.frame(x=x, z=rep(" ", length(x)))
    ggplot(df, aes(z, x)) + geom_boxplot() + xlab("")
  })
  
  output$text1 <- renderText({
      lns <- "<table>"
      lns[2] <- paste("<tr><th>Sample Size&nbsp;</th><td>", summaries()[1], "</td></tr")
      lns[3] <- paste("<tr><th>Mean&nbsp;&nbsp;</th><td>", summaries()[2], "</td></tr")
      lns[4] <- paste("<tr><th>Standard Deviation&nbsp;&nbsp;&nbsp;</th><td>", summaries()[3], "</td></tr")
      lns[5] <- "</table>"
      lns
  })
  
})