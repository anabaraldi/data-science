library(shiny)
library(dplyr)
library(chron)

bikes_in_sp <- read.csv("bikes_in_sp_dataset.csv", stringsAsFactors = FALSE) %>%
    mutate(d = as.Date(d)) %>%
    mutate(st = as.factor(st))

clean_data <- function(bikes_in_sp) {
    new_df <- bikes_in_sp %>%
    mutate(sh = chron(times = sh)) %>%
    mutate(eh = chron(times = eh)) %>%
    mutate(b = as.numeric(b)) %>%
    mutate(t = as.numeric(t)) %>%
    mutate(bikes_per_minute = round(b / as.numeric(minutes(eh - sh)), 2)) 
    
    return(new_df)
}

shinyServer(
    function(input, output) {
        data_transformation <- reactive({
            if (input$submit > 0) {
                df <- data.frame(d = input$d,
                                 sh = input$sh,
                                 eh = input$eh,
                                 c = input$c,
                                 l = input$l,
                                 b = input$b,
                                 st = input$st,
                                 t = input$t)
                new_df <- rbind(bikes_in_sp, df)
                new_df <- clean_data(new_df)
                mean_bikes_per_minute <- round(mean(new_df$bikes_per_minute, na.rm = TRUE), 2)
                
                return(list(mean_bikes_per_minute = mean_bikes_per_minute))
                }
            })
        
        output$mean_bikes_per_minute <- renderPrint(data_transformation()$mean_bikes_per_minute)
    }
)