shinyUI(fluidPage(
  numericInput("n", "Sample Size", 1000),
  plotOutput("histogram")
))