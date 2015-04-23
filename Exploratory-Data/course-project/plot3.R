#libraries
library(dplyr)
library(ggplot2)

# Reading and cleaning data
unzip("exdata-data-NEI_data.zip")

# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# The following code will filter only Baltimore measurements, then group the data by year and type
# and take the sum for the groups
groupedNEI <- mutate(NEI, type=as.factor(type)) %>%
    filter(fips == "24510") %>%
    group_by(year, type) %>%
    summarise(emissionsSum=sum(Emissions))

# Creating the plot
png("plot3.png")
ggplot(groupedNEI, aes(year, emissionsSum, color=type)) + 
    geom_smooth() +
    xlab("Year") +
    ylab("Total PM2.5 Emission (in ton)") +
    ggtitle("Total PM2.5 Emission in Baltimore City by Type - 1999 to 2008")
dev.off()
    
    
