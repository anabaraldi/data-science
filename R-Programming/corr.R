# Part 3
# Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows
# corr <- function(directory, threshold = 0) {
#     ## 'directory' is a character vector of length 1 indicating
#     ## the location of the CSV files
#     
#     ## 'threshold' is a numeric vector of length 1 indicating the
#     ## number of completely observed observations (on all
#     ## variables) required to compute the correlation between
#     ## nitrate and sulfate; the default is 0
#     
#     ## Return a numeric vector of correlations
# }
# 
# ## Source to submit the parts of the assignment
# source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")

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
            correl <- c(correl, cor(dat$sulfate, dat$nitrate))  
        }
    }
    correl
}