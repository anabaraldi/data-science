#libraries
library(dplyr)

# Reading and cleaning data
unzip("exdata-data-NEI_data.zip")

# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# The following code will group the data by year and then take the sum for each year
groupedNEI <- group_by(NEI, year) %>%
    summarise(emissionsSum=sum(Emissions)) %>%
    mutate(emissionsSum=emissionsSum / 10 ^ 3)

# Creating the plot
png("plot1.png")
barplot(groupedNEI$emissionsSum, 
        names.arg=groupedNEI$year,
        xlab="Year",
        ylab="Total PM2.5 Emission (in kiloton)",
        main="Total PM2.5 Emission - 1999 to 2008")
dev.off()


