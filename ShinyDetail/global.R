# libraries
library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)

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

# Test plot
# x_axis <- list(
#   title = "Effort",
#   zeroline = TRUE,
#   showline = TRUE,
#   showticklabels = FALSE,
#   showgrid = FALSE,
#   #rangemode = "tozero"
#   range = c(0, 10)
# )
# 
# y_axis <- list(
#   title = "Value",
#   zeroline = TRUE,
#   showline = TRUE,
#   showticklabels = FALSE,
#   showgrid = FALSE,
#   #rangemode = "tozero"
#   range = c(0, 10)
# )
# 
# Plot1 <- plot_ly(
#   df, x = ~Effort, y = ~Value, type = 'scatter', mode = "markers", marker = list(size = 20),
#   # Hover text:
#   text = ~paste("Project: ", Project, '<br>Team:', Team),
#   color = ~Team
# ) %>%
#   layout(xaxis = x_axis, yaxis = y_axis)
# Plot1

