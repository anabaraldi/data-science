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

## Quizz 3

##Question 1
if(!file.exists("./idaho")){dir.create("./idaho")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./idaho/idaho.csv",method="curl")
idahoData <- read.csv("./idaho/idaho.csv")
agricultureLogical <- idahoData$ACR > 2 & idahoData$AGS > 5
which(agricultureLogical)

##Question 2
library(jpeg)
if(!file.exists("./jeff")){dir.create("./jeff")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile="./jeff/jeff.jpg",method="curl")
jeff <- readJPEG("./jeff/jeff.jpg", native = TRUE )
quantile(jeff, probs = c(0.3, 0.8))

##Question 3
library(dplyr)
if(!file.exists("./gdp")){dir.create("./gdp")}
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1,destfile="./gdp/gdp.csv",method="curl")
download.file(fileUrl2,destfile="./gdp/education.csv",method="curl")
gdp <- read.csv("./gdp/gdp.csv", skip = 4); education <- read.csv("./gdp/education.csv")
gdp$X.1 <- as.numeric(as.character(gdp$X.1)) ## to transform the factor in numeric without changing the order
mergedData <- merge(education, gdp[1:190,], by.x = "CountryCode", by.y = "X") #we don't use all the lines in gdp because there are some that aren't countries
arranged <- arrange(mergedData, desc(X.1))
arranged[13,1]

##Question 4
mergedData %>%
    group_by(Income.Group) %>%
    summarise(mean(X.1))

##Question 5
library(Hmisc)
mergedData$X.1groups <- cut2(mergedData$X.1, g=5) ## it will create a new col by divinding the original one in five groups (quantiles)
table(mergedData$X.1groups, mergedData$Income.Group)
