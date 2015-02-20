## Source to submit the parts of the assignment
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")

# Setting the working directory
setwd("~/workspace/data-science/R-Programming")

pollutantmean <- function(directory, pollutant, id = 1:332) {
    directoryFiles <- list.files(directory, full.names=TRUE)
    dat <- data.frame()
    for(i in id) {
        dat <- rbind(dat, read.csv(directoryFiles[i]))
    } 
    mean(dat[, pollutant], na.rm = TRUE)
}

