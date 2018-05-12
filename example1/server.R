shinyServer(function(input, output) {
  output$histogram <- renderPlot({
    x <- rnorm(input$n)  
    bw <- diff(range(x))/50
    ggplot(data.frame(x=x), aes(x)) +
    geom_histogram(color = "black", fill = "white", binwidth = bw) + 
    labs(x="x", y="Counts")
  })
})