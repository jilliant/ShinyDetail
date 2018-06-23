# server.R definition
server <- function(input, output){
  
    x_axis <- list(
      title = "Effort",
      zeroline = TRUE,
      showline = TRUE,
      showticklabels = FALSE,
      showgrid = FALSE,
      #rangemode = "tozero"
      range = c(0, 10)
    )
    
    y_axis <- list(
      title = "Value",
      zeroline = TRUE,
      showline = TRUE,
      showticklabels = FALSE,
      showgrid = FALSE,
      #rangemode = "tozero"
      range = c(0, 10)
    )
    
    
    # reverse axix
    # xaxis = list(autorange = "reversed")
    
    output$Plot1 <- renderPlotly({
      plot_ly(
        df, x = ~Effort, y = ~Value, type = 'scatter', mode = "markers", marker = list(size = 20),
        # Hover text:
        text = ~paste("Project: ", Project),
        color = ~Team
      ) %>%
        layout(xaxis = x_axis, yaxis = y_axis, showlegend = FALSE)
    })
    
}
