# Create data
Project <- c("Tyrannosaurus Rex", 
             "Allosaurus", 
             "Stegosaurus", 
             "Triceratops", 
             "Velociraptor", 
             "Apatosaurus")
Value <- c("6","3","2","6","9","4")
Effort <- c("8","7","2","3","8","5")
Team <- c("Theropods", "Theropods", "Thyreophora", "Cerapods", "Theropods", "Sauropods")
Summary <- c("Tyrannosaurus Rex had powerful back legs that let it hunt prey over short distances at up to 20mph (32 kph). They would have charged out of the undergrowth to surprise their prey - and their flexible neck helped them adjust the angle of attack.",
             "Paleontologists believe Allosaurus attained its full adult size by the age of 15 or so (at which point it was no longer vulnerable to predation by other large theropods, or other hungry Allosaurus adults). Barring disease, starvation or thagomizer wounds inflicted by angry stegosaurs, this dinosaur may have been capable of living and hunting for another 10 or 15 years",
             "Stegosaurus had a brain the size of a walnut - only 3 centimetres long and weighing 75 grams.",
             "The name ‘Triceratops’ comes from the Greek language, with ‘tri’ meaning three and ‘keratops’ meaning horned face.",
             "Velociraptor, which means “speedy thief,” had a sharp, deadly, sickle-shaped, retractable, 3.5-inch (9 cm) claw on each foot (located on each second toe). The Velociraptor may have been able to run up to roughly 40 mph (60 km/hr) for short bursts.",
             "Apatosaurus, also known as Brontosaurus, was a member of a group of sauropod dinosaurs. It lived during Jurassic Period, 155.7 to 150.8 million years ago, on a territory of Colorado, Utah, Wyoming, Oklahoma and Mexico.")
Value <- as.numeric(Value)
Effort <- as.numeric(Effort)


df <- data.frame(Project, Value, Effort, Team, Summary)
df$Id <- 1:nrow(df)

# server.R definition
server <- function(input, output){
  
    x_axis <- list(
      title = "More Difficult                 <b> Implementation </b>                 Simpler",
      zeroline = TRUE,
      showline = TRUE,
      showticklabels = FALSE,
      showgrid = FALSE,
      #rangemode = "tozero"
      range = c(0, 10),
      autorange = "reversed"
    )
    
    y_axis <- list(
      title ="Low                         <b> Benefits </b>                         High",
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
        text = ~paste("Project: ",Project),
        hoverinfo="text",
        color = ~Team
      ) %>%
        layout(xaxis = x_axis, yaxis = y_axis, showlegend = FALSE)
    })
    
    ## Create text paragraph of info on a selected point
    output$ProjText <- renderText({
      
      event.data <- event_data(event = "plotly_click", source = "ProjLink")
      
      if (is.null(event.data)) {
        print("Click a point")
      } else { 
        df.summary <- df %>% filter(Id == event.data$key)
        
        # Convert from factor 
        df.summary$Project <- as.character(df.summary$Project)
        df.summary$Team <- as.character(df.summary$Team)
        df.summary$Summary <- as.character(df.summary$Summary)
        
        HTML('<p><b>Project:</b>', df.summary$Project, '</p>',
             '<p><b>Team:</b>', df.summary$Team, '</p>',
             #'<p><b>Effort:</b>', event.data[["x"]], '<br>',
             #'<b>Value:</b>', event.data[["y"]],'<br></p>',
             '<p><b>Summary:</b>', df.summary$Summary, '</p>')
      }
    })
    
    output$ProjSummary <- renderPrint({
      d <- event_data("plotly_click")
      if (is.null(d)) "Click a dot, double click to clear." else d
    })
    
}
