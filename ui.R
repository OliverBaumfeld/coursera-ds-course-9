#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Incredible Lottery Number Generator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
      sidebarPanel(
        numericInput(inputId= "picks", label="How many tickets do you need?", 2, min = 1, max = 20, step = 1),
        numericInput(inputId= "numbersperticket", label="How many numbers per ticket?", 6, min = 1, max = 1000, step = 1),
        numericInput(inputId= "numbermax", label="What is the highest possible number?", 45, min = 1, max = 1000, step = 1)
      ),
    
    # Show a plot of the generated distribution
      mainPanel(
          p("This app allows you to generate lottery numbers. Please select ..."),
          tags$ul(
                tags$li("the number of tickets (max = 20),"),
                tags$li("the number of numbers per ticket (max = 1000) and "),
                tags$li("the maximum possible number of your favourite lottery (max = 1000).")
          ),
          p("Want to know more? Check out the pitch presentation at http://rpubs.com/OliverB/c9week4shiny "),
          textOutput("message"),
          verbatimTextOutput ("tickets")
    )
  )
))
