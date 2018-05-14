
library(shiny)

ui <- fluidPage(
  titlePanel("2-D Random Walk"),
  sliderInput("step","Step",
              min=1, max=100, value=1, step=1,
              animate=animationOptions(interval = 500, loop = FALSE)),
  plotOutput("plot", width="500", height="500")
)
server <- function(input, output) {
  data <- reactive({
    x <- cumsum(c(rep(0, 10), rnorm(1000)))  
    y <- cumsum(c(rep(0, 10), rnorm(1000)))
    data.frame(x=x, y=y)
  })
  
  make.plot <- reactive({
    xymax <- abs(max(data()))
    print(xymax)
    ggplot(data(), aes(x, y)) +
      lims(x=1.2*c(-xymax, xymax), y=1.2*c(-xymax, xymax)) +
      labs(x="x", y="")  
    
  })
  
  output$plot <- renderPlot({
    
    for(i in 1:input$step) {
      plt <- make.plot() +
        geom_point(data=data()[10*i, ], aes(x,y), size=2, color="red") + 
        geom_line(data=data()[1:(10*i), ], aes(x,y), 
                  size=0.25, color="blue", alpha=0.5)
    }     
    plt
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

