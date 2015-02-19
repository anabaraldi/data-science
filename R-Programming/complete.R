## Source to submit the parts of the assignment
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")

# Setting the working directory
setwd("~/workspace/data-science/R-Programming")

complete <- function(directory, id = 1:332) {
    directoryFiles <- list.files(directory, full.names=TRUE)
    nobs <- numeric()
    for(i in id) {
        dat <- read.csv(directoryFiles[i])
        dat <- complete.cases(dat)
        nobs <- c(nobs, sum(dat))
    }
    df <- data.frame(id, nobs) 
    df
}
     