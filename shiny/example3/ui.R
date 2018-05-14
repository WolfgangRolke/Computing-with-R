shinyUI(fluidPage(
  titlePanel("Histogram or Boxplot App"),
  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Sample Size", 1000),
      selectInput("whichgraph", "What Graph?", 
          choices=c("Histogram", "Boxplot"), selected="Boxplot"),
      conditionalPanel(condition="input.whichgraph=='Histogram'",     
         textInput("nbins", "Number of bins", "50", width = "20%")
      )   
    ),
    mainPanel(
      conditionalPanel(condition="input.whichgraph=='Histogram'",
         plotOutput("plot1")
      ),
      conditionalPanel(condition="input.whichgraph=='Boxplot'",
         plotOutput("plot2")
      )   
    )  
  )  
))