library(shiny)
library(mlbench)
library(plotly)
library(shinythemes)
library(dplyr)

# ui.R definition
ui <- fluidPage(
  # Set theme
  theme = shinytheme("spacelab"),
  
  # Title and Subtitle 
  h2("Effort vs Value"),
  h4("This Shiny app showcases coupled events using Plotly's ", tags$code("event_data()"), " function."),
  
  # bit of space
  tags$hr(),
  
  # Plot and Output
  fixedRow(
    column(6, plotlyOutput("Plot1")),
    column(6, verbatimTextOutput("Click"))
   ),
  
  # Help text
  tags$hr(),
  tags$blockquote("Click a dot, get the deets.")
  
)