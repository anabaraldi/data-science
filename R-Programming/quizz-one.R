#Quiz Week 1 - R Programming

source("~/workspace/data-science/R/R-Programming")
data <- read.csv("hw1_data.csv")

#To give the 47th row, first col
data[[47,1]]

#To give the number of rows
nrow(data)

#take the mean of a col, without the NA
dataOzone <- data$Ozone
bad <- is.na(dataOzone)
dataOzone <- dataOzone[!bad]
mean(dataOzone)

#where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R
dataSolar <- data$Solar.R[data$Temp[data$Ozone > 31] > 90]
bad1 <- is.na(dataSolar)
dataSolar <- dataSolar[!bad1]
mean(dataSolar)

#mean of "Temp" when "Month" is equal to 6
dataTemp <- data$Temp[data$Month == 6]
mean(dataTemp)

#maximum ozone value in the month of May (i.e. Month = 5)
dataOzone2 <- data$Ozone[data$Month == 5]
max(dataOzone2)