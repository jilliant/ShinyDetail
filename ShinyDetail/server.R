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
        key = ~Id, source = "ProjLink",
        # Hover text:
        text = ~paste("Project: ", Project),
        color = ~Team
      ) %>%
        layout(xaxis = x_axis, yaxis = y_axis, showlegend = FALSE)
    })
    
    ## Create text paragraph of info on a selected point
    output$ProjText <- renderText({
      
      event.data <- event_data(event = "plotly_click", source = "ProjLink")
      
      if (is.null(event.data)) {
        print("Click to see the link of the point.")
      } else { 
        df.summary <- df %>% filter(Id == event.data$key)
        
        # Convert from factor 
        df.summary$Project <- as.character(df.summary$Project)
        df.summary$Team <- as.character(df.summary$Team)
        df.summary$Summary <- as.character(df.summary$Summary)
        
        HTML('<p><b>Project:</b>', df.summary$Project, '</p>',
             '<p><b>Team:</b>', df.summary$Team, '</p>',
             '<p><b>Effort:</b>', event.data[["x"]], '<br>',
             '<b>Value:</b>', event.data[["y"]],'<br></p>',
             '<p><b>Summary:</b>', df.summary$Summary, '</p>')
      }
    })
    
    output$ProjSummary <- renderPrint({
      d <- event_data("plotly_click")
      if (is.null(d)) "Click a dot, double click to clear." else d
    })
    
}
