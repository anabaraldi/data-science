library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Bikes in SP Dataset"),
    sidebarPanel(
        h3("New inputs for our dataset"),
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
        verbatimTextOutput("mean_bikes_per_minute")
    )
))