
library(shiny)


shinyUI(fluidPage(
  
        titlePanel("Interactive Plots for US Arrests by State in 1973"),
        
        sidebarPanel(
                selectInput('xcol', 'X Variable', names(USArrests)),
                selectInput('ycol', 'Y Variable', names(USArrests)),
                h4("Each red dot in the plot represents the number of arrests by crime for a US state
                   for the year 1973. Input your choices for the x and y variables 
                   above to see the correlation between them displayed by the scatterplot.")
                ),
        
        
        
        fluidRow(
                column(width = 6, class = "well",
                       
                       plotOutput("plot1", height = 310),
                       resetOnNew = TRUE
                       
                )
                
        ),
        
        fluidRow(
                column(width = 6,  class = "well",
                       h3("Plotting Data for Assault Versus Rape "),
                       h4("Each blue dot in the plot represents the number of assaults versus rapes 
                          for a US state in the year 1973. The shade of blue represents the 
                          number of murders. Click and select a region in the 
                          plot to see the states corresponding to the points in the region 
                          and the number of rapes, assaults and murders for the selected states. Look for 
                          the output below."),
                       resetOnNew = TRUE
                       ),
                
                column(width = 6,  class = "well",
                       plotOutput("plot2", height = 199,
                                  click = "plot2_click",
                                  brush = brushOpts(
                                          id = "plot2_brush",
                                          resetOnNew = TRUE
                                  )
                       )
                )
                ),
        
        fluidRow(
                
                column(width = 6,  class = "well",
                       h4("Brushed points"),
                       verbatimTextOutput("brush_info")
                )
        )
))
