shinyUI(fluidPage(
  sliderInput("step","Step",
     min=1, max=100, value=1, step=1,
     animate=animationOptions(interval = 500, loop = FALSE)),
  plotOutput("plot", width="500", height="500")
))