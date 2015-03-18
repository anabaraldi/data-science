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