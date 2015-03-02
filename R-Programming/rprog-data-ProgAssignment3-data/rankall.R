source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")

setwd("~/workspace/data-science/R-Programming/rprog-data-ProgAssignment3-data")

rankall <- function(outcome, num = "best") {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ranking <- data.frame()
    
    checkState <- split(data, data$State)
    namesState <- names(checkState)
    state <- vector()
    hospVector <- vector()
    for(i in 1:length(namesState)) {
        cState <- namesState[i]
        check <- checkState[cState]
        check <- as.data.frame(check)
        
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
        
        check[ , col] <- as.numeric(check[ , col])
        check <- check[order(check[ ,2]), ]
        check <- check[order(check[ , col]), ]
        rmvNa <- is.na(check[ ,col])
        check <- check[!rmvNa, ]
        
        local_num <- if(num == "best"){
            1
        } else if(num == "worst"){
           nrow(check)
        }
        
        state <- c(state, cState)
        hospVector <- c(hospVector, check[local_num, 2])  
    }
    
    ranking <- cbind(hospVector, state)
    colnames(ranking) <- c("hospital", "state")
    rownames(ranking) <- namesState
    ranking <- as.data.frame(ranking)
    ranking
}