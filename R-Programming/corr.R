## Source to submit the parts of the assignment
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")

# Setting the working directory
setwd("~/workspace/data-science/R-Programming")

corr <- function(directory, threshold = 0) {
    directoryFiles <- list.files(directory, full.names=TRUE)
    correl <- numeric()
    id <- 1:332
    for(i in id) {
        dat <- read.csv(directoryFiles[i])
        dat <- dat[complete.cases(dat), ]
        if(nrow(dat) > threshold){
            cat(i, nrow(dat), "\n")
            correl <- c(correl, cor(dat$sulfate, dat$nitrate))  
        }
    }
    correl
}