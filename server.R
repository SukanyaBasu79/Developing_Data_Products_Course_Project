
library(shiny)


shinyServer(function(input, output) {
        selectedData <- reactive({
                USArrests[, c(input$xcol, input$ycol)]
        })
        
        output$plot1 <- renderPlot({
                plot(selectedData(), pch = 20, cex = 3, col = "red")
                
        })
        
        output$plot2 <- renderPlot({
                ggplot(USArrests, aes(Assault, Rape, colour=Murder)) + geom_point(size = 5)
        })
        
        output$click_info <- renderPrint({
                nearPoints(USArrests, input$plot2_click, addDist = TRUE)
        })
        
        output$brush_info <- renderPrint({
                brushedPoints(USArrests, input$plot2_brush)
        })
   
})
