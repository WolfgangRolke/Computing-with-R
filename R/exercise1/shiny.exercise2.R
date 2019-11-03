ui <- fluidPage(
    numericInput(inputId = "n", # name of variable
                 label = "Sample Size", # text on page
                 value = 1000), # starting value
    textInput(inputId = "nbins", 
              label = "Number of bins", 
              value = "50", 
              width = "20%"), # size of box
    plotOutput("plot1")
)
server <- function(input, output) {
    output$plot1 <- renderPlot({
        x <- rnorm(input$n) 
        k <- as.numeric(input$nbins)
        hist(x, k, main="", 
            xlab = "x", ylab = "Counts")
    })
}
shinyApp(ui, server)
