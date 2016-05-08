library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Bikes in SP Dataset"),
    sidebarPanel(
        h4("Hey, I'm building a new dataset to study whether the usage of bikes is growing in São Paulo/Brazil!
           This app function is to input new data into my dataset!"),
        h5("Input new data below:"),
        dateInput("d", "Date"),
        textInput("sh", "Start Hour", value = "12:00:00"),
        textInput("eh", "End Hour", value = "12:20:00"),
        checkboxGroupInput("c", "Climate",
                           c("Clear Sky" = "clear_sky",
                             "Raining" = "raining",
                             "Cloudy" = "cloudy",
                             "Drizzling" = "drizzling")),
        checkboxGroupInput("l", "Location",
                           c("Berrini" = "berrini",
                             "Faria Lima" = "faria_lima",
                             "Olimpíadas" = "olimpiadas",
                             "Paulista" = "paulista",
                             "Artur Azevedo" = "artur_azevedo")),
        checkboxGroupInput("st", "Daylight Saving Time",
                           c("No" = 0,
                             "Yes" = 1)),
        numericInput('t', 'Temperature', value = 22, min = 0, max = 40, step = 1),
        numericInput("b", "Number of Bikes", value = 15),
        actionButton("submit","Submit")
    ),
    mainPanel(
        h3("We have new information to continue building our dataset! Thanks for your help!"),
        h5("Just so you know we have a new mean value for our most important variable: BIKES PER MINUTE, check it out!"),
        
        h5("Before mean value"),
        verbatimTextOutput("old_mean_bikes_per_minute"),
        h5("After mean value"),
        verbatimTextOutput("new_mean_bikes_per_minute")
        
    )
))