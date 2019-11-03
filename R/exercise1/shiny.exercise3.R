ui <- fluidPage(
    numericInput(inputId = "n", # name of variable
                 label = "Sample Size", # text on page
                 value = 1000), # starting value
    textInput(inputId = "nbins", 
              label = "Number of bins", 
              value = "50", 
              width = "20%"), # size of box
    selectInput("whichgraph", "What Graph?", 
                choices = c("Histogram", "Boxplot"),
                selected = "Boxplot"),
    conditionalPanel(
        condition="input.whichgraph=='Histogram'",    
           plotOutput("plot1")
    ),
    conditionalPanel(
        condition="input.whichgraph=='Boxplot'",
        plotOutput("plot2")
    )        
)
server <- function(input, output) {
    output$plot1 <- renderPlot({
          x <- rnorm(input$n) 
          k <- as.numeric(input$nbins)
          hist(x, k, main="", 
            xlab = "x", ylab = "Counts")
    })
    output$plot2 <- renderPlot({
        x <- rnorm(input$n) 
         boxplot(x)
     })      
}
shinyApp(ui, server)
