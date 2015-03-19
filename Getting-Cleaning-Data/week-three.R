## Video Lectures

if(!file.exists("./week3-rest")){dir.create("./week3-rest")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./week3-rest/restaurants.csv",method="curl")
restData <- read.csv("./week3-rest/restaurants.csv")

restData[restData$zipCode %in% c("21212", "21213"), ] ## it will select only the rows where the zipCode matches the selection

data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data=DF) ## it will cross the cols, 1# is the data(Freq), then which cols I wanna cross
xt

## data reshaping
library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp")) ## in this case it will repeat the carnames two times because we have two variables

cylData <- dcast(carMelt, cyl ~ variable, mean) ## it will summarize the data for each value of cyl and calculate the mean for mpg and hp
cylData

## merging data
if(!file.exists("./week3-peerreview")){dir.create("./week3-peerreview")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./week3-peerreview/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./week3-peerreview/solutions.csv",method="curl")
reviews = read.csv("./week3-peerreview/reviews.csv"); solutions <- read.csv("./week3-peerreview/solutions.csv")

mergedData <- merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)