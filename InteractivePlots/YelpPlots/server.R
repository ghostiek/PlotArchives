library(shiny)

#business <- readLines("~/dataset/business.json", n = 10000) %>%
#  lapply(fromJSON)
#business_info <- lapply(1:length(business), function(x) unlist(business[[x]][c(1,10,11)])) %>%
#  do.call(rbind, .) %>% as.data.frame(stringsAsFactors=FALSE)

shinyServer(
  function(input, output){
    output$plot1 <- renderPlot({
      ggplot(business_info[business_info$stars==input$slide,], aes(as.numeric(business_info[business_info$stars==input$slide,]$review_count))) +
        geom_density() +
        xlim(0,50) +
        xlab("Number of Reviews") +
        ggtitle(paste("Numer of Reviews vs.", input$slide, "Star Rating"))
      })
    output$info <- renderText({
      paste0("Number of reviews =", input$plot_click$x, "\nDensity =", input$plot_click$y)
    })
  }
)