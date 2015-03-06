## Video Lectures

##checking if a directory exists

if(!file.exists("data")) {
    dir.create("data")
}

## reading XML files

library(XML)
fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL, useInternal = TRUE)
rootNode <- xmlRoot(doc) ##access to the root of the doc, it gives me just the info inside the code
xmlName(rootNode) ##give the major root, sth like the title of the doc
names(rootNode) ##give the other elements above the xmlName
rootNode[[1]] ## it will give the first element, looks like a list

xpathSApply(rootNode, "//name", xmlValue) ## it gives me all the elements inside the name tag
xpathSApply(rootNode, "//price", xmlValue) ## the same with the price

## reading JSON files

library(jsonlite)
jsonData <- fromJSON("http://api.verios.com.br/assets/ibov/dailies?asc=d")
names(jsonData) ##give a data frame with the names

## using data.table()
library(data.table)
df <- data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
dt <- data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
dt <- dt[,w:=z^2] ## it will add a new col to the data table

## Quizz one

## 1 how many propertis are worth US$ 1 million (col = VAL, number = 24)
if(!file.exists("Getting-Cleaning-Data")) {
    dir.create("Getting-Cleaning-Data")
}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv ", destfile = "./Getting-Cleaning-Data/QuizzOne-QOne", method = "curl")
idahoData <- read.csv("./Getting-Cleaning-Data/QuizzOne-QOne")
table(idahoData$VAL) ##count each element in the col

## 3
if(!file.exists("Getting-Cleaning-Data")) {
    dir.create("Getting-Cleaning-Data")
}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ", destfile = "./Getting-Cleaning-Data/QuizzOne-QThree", method = "curl")
dat <- read.xlsx("./Getting-Cleaning-Data/QuizzOne-QThree", sheetIndex = 1, header = TRUE, colIndex = 7:15, rowIndex = 18:23)

## 4
doc <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
table(as.data.frame(xpathSApply(rootNode, "//zipcode", xmlValue))) ## to count the n with the zipcode 21231

## 5
if(!file.exists("Getting-Cleaning-Data")) {
    dir.create("Getting-Cleaning-Data")
}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv ", destfile = "./Getting-Cleaning-Data/QuizzOne-QFive", method = "curl")
DT <- fread("./Getting-Cleaning-Data/QuizzOne-QFive")
