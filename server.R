#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    observeEvent(input$picks, {
        picks <- input$picks 
        max_picks <- 20
        
        if (!is.na(picks)) {
            if (picks > max_picks) {
                ## Conditions
                picks <- max_picks
                output$message <- renderText("Maximum allowed number of picks: 20. You shouldn't gamble this much anyway!")
            }
            else if (picks <= 0) {
                picks <- 1
                output$message <- renderText("Come on ... pick > 0.")
            }
            else {
                output$message <- renderText("Here are your numbers:")
            }
            
            output$tickets <- renderText({
                str_text <- ""
                if (input$numbermax > 1000) {
                    numbermax <- 1000
                    output$message <- renderText("max = 1000, Here are your numbers:")
                }
                else {
                    numbermax <- input$numbermax
                }
                
                if (input$numbersperticket > 1000) {
                    numbersperticket <- 1000
                    output$message <- renderText("max = 1000, Here are your numbers:")
                }
                else {
                    numbersperticket <- input$numbersperticket
                }
                
                for (ii in 1:picks) {
                    possible_numbers <- seq_len(numbermax)
                    s1 <- sample(possible_numbers, size = numbersperticket, replace=FALSE)
                    str_text <- paste0(str_text, "Ticket ", as.character(ii), ": ", paste(s1, collapse = '-'), "\n")
                }
                str_text
            })
        }
    })
})
