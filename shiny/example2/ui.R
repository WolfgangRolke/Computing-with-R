shinyUI(fluidPage(
  titlePanel("Histogram App"),
  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Sample Size", 1000),
      textInput("nbins", "Number of bins", "50", width = "20%")
    ),
    mainPanel(
      plotOutput("plot1")
    )  
  )  
))