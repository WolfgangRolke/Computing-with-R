shinyUI(fluidPage(
  titlePanel("Histogram or Boxplot App"),
  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Sample Size", 1000),
      conditionalPanel(condition="input.mytabs=='Histogram'",     
         textInput("nbins", "Number of bins", "50", width = "20%")
      )   
    ),
    mainPanel(
    tabsetPanel(
          tabPanel("Histogram", plotOutput("plot1")),
          tabPanel("Boxpot", plotOutput("plot2")),
          tabPanel("Summary Statistics", uiOutput("text1")),
          id="mytabs"
      )
    )  
  )  
))