library(shiny)
library(ggplot2)
shinyUI(fluidPage(
  titlePanel(title = "Yelp Review Count density to Stars given"),
  sidebarLayout(
    sidebarPanel(
                 sliderInput("slide", "Select the value on the slider", min = 1, max = 5, value = 1, step = 0.5),
                 numericInput("xmin", "Select the Minimum x", "0"),
                 numericInput("xmax", "Select the Maximum x", "50"),
                 verbatimTextOutput("info")
                 ),
    mainPanel(
              plotOutput("plot1", click = "plot_click")
    )
  )
  )
)