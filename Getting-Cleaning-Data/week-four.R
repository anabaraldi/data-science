## Video Lectures

if(!file.exists("./cameras")){dir.create("./cameras")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./cameras/cameras.csv",method="curl")
cameraData <- read.csv("./cameras/cameras.csv")
tolower(names(cameraData)) # all the letters are lower
grep("Alameda",cameraData$intersection) # it will tell the row number where the world "Alameda" appears, grepl() gives an logical with T/F

reviews <- read.csv("./week3-peerreview/reviews.csv"); solutions <- read.csv("./week3-peerreview/solutions.csv")
sub("_","",names(reviews)) # to replace a pattern in a string

## Quizz

# Q1
idaho <- read.csv("./idaho/idaho.csv")
strsplit(names(idaho), "wgtp")[[123]]

# Q2
gdp <- read.csv("./gdp/gdp.csv", skip = 4) 
gdp <- gdp[1:190,] #it's necessary because the tail of the data aren't about the 190 countries
gdp$X.4 <- as.numeric(sapply(gdp$X.4, function(g) {
    gsub(",", "", g)
}))
mean(gdp$X.4, na.rm=T)

#Q3
grep("^United", gdp$X.3)

#Q4
education <- read.csv("./gdp/education.csv")
gdp$X.1 <- as.numeric(as.character(gdp$X.1)) ## to transform the factor in numeric without changing the order
mergedData <- merge(education, gdp, by.x = "CountryCode", by.y = "X")

table(grepl("Fiscal year end: June", mergedData$Special.Notes))

#Q5
library(quantmod)
amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn)
x <- sapply(sampleTimes, function(date){
    format(date, "%Y")
})
table(x)
y <- sapply(sampleTimes, function(date){
    format(date, "%a%Y")
})
table(y)