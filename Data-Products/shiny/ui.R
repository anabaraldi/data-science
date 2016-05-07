library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Data Science"),
    sidebarPanel(
        h3("Sidebar text")
    ),
    mainPanel(
        h3("Main panel text")
    )
))