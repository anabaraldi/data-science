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

