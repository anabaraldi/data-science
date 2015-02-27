source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")

setwd("~/workspace/data-science/R-Programming/rprog-data-ProgAssignment3-data")

best <- function(state, outcome) {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    checkState <- split(data, data$State)
    if(!state %in% names(checkState)) {
        stop("invalid state")
    }
    checkState <- checkState[state]
    checkState <- as.data.frame(checkState)
    
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("invalid outcome")
    }
    
    col <- if(outcome == "heart attack"){
        11
    } else if(outcome == "heart failure") {
        17
    } else if(outcome == "pneumonia") { 
        23
    }
    
    checkState[ , col] <- as.numeric(checkState[ , col])
    checkState <- checkState[order(checkState[ , col]), ]
    checkState[1, 2]
}

