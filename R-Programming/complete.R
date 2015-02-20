# Part 2
# Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows
# complete <- function(directory, id = 1:332) {
#     ## 'directory' is a character vector of length 1 indicating
#     ## the location of the CSV files
#     
#     ## 'id' is an integer vector indicating the monitor ID numbers
#     ## to be used
#     
#     ## Return a data frame of the form:
#     ## id nobs
#     ## 1  117
#     ## 2  1041
#     ## ...
#     ## where 'id' is the monitor ID number and 'nobs' is the
#     ## number of complete cases
# }
# 
# ## Source to submit the parts of the assignment
# source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")

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
     