library(shiny)
library(dplyr)
library(jsonlite)

business <- readLines("~/dataset/business.json", n = 10000) %>%
  lapply(fromJSON)
business_info <- lapply(1:length(business), function(x) unlist(business[[x]][c(1,10,11)])) %>%
  do.call(rbind, .) %>% as.data.frame(stringsAsFactors=FALSE)

shinyServer(
  function(input, output){
    output$plot1 <- renderPlot({
      plotDens()
      })
    output$info <- renderText({
      paste0("Number of reviews =", input$plot_click$x, "\nDensity =", input$plot_click$y)
    })
    
    plotDens <- function(){
      ggplot(business_info[business_info$stars==input$slide,], aes(as.numeric(business_info[business_info$stars==input$slide,]$review_count))) +
        geom_density() +
        xlim(input$xmin, input$xmax) +
        xlab("Number of Reviews") +
        ggtitle(paste("Numer of Reviews vs.", input$slide, "Star Rating"))
    }
  }
)