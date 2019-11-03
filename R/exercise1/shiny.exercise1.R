ui <- fluidPage(
    numericInput(inputId = "n", # name of variable
                 label = "Sample Size", # text on page
                 value = 1000), # starting value
    plotOutput("plot1")
)
server <- function(input, output) {
    output$plot1 <- renderPlot({
        x <- rnorm(input$n)  
        hist(x, 50, main="", 
            xlab = "x", ylab = "Counts")
    })
}
shinyApp(ui, server)
