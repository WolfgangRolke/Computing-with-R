shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    x <- rnorm(input$n)  
    bw <- diff(range(x))/as.numeric(input$nbins)
    ggplot(data.frame(x=x), aes(x)) +
    geom_histogram(color = "black", fill = "white", binwidth = bw) + 
    labs(x="x", y="Counts")
  })
  
  output$plot2 <- renderPlot({
    x <- rnorm(input$n)  
    df <- data.frame(x=x, z=rep(" ", length(x)))
    ggplot(df, aes(z, x)) + geom_boxplot() + xlab("")
  })
  
})