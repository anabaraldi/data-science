## Videos Lecture

## MySQL reading
library(RMySQL)
hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
dbListFields(hg19, "affyU133Plus2") #they are the col (fields) names, and the strange name is one table in hg19
dbGetQuery(hg19, "select count(*) from affyU133Plus2") #it tells me how many rows (records) we have
affyData <- dbReadTable(hg19, "affyU133Plus2")
dbDisconnect(hg19)

## HDF5 reading
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa") #create a subgroup inside foo called foobaa
h5ls("example.h5")

## web reading

con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML) ## formatted way :)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html <- htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, "//title", xmlValue)

## Quizz two

## Question One
library(httr)
library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "0ee3aa95ec5ad37812b4", "9075839df1ac1dd264069b86e14cb111fc9d7cfa")
# myapp <- oauth_app("github", "0ee3aa95ec5ad37812b4")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[5, "created_at"]

## Question two
library(sqldf)
acs <- read.csv("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

## Question four
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode
nchar(c(htmlCode[10], htmlCode[20], htmlCode[30], htmlCode[100]))

## Question five
x <- read.fwf(
    file=url("http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
    skip=4,
    widths=c(12, 7,4, 9,4, 9,4, 9,4))

tail(x)
sum(x[4])