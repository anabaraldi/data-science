#libraries
library(dplyr)

# Reading and cleaning data
unzip("exdata-data-NEI_data.zip")

# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# The following code will filter the SCC file so we can subset the data with only the Coal Combustion-Related Sources
coalSCC <- filter(SCC, grepl("[Cc]oal", SCC$Short.Name))

# The following code will filter only Coal Combustion-Related sources, then group the data by year 
# and take the sum for each year
coalNEI <- filter(NEI, SCC %in% coalSCC$SCC) %>%
    group_by(year) %>%
    summarise(emissionsSum=sum(Emissions)) %>%
    mutate(emissionsSum=emissionsSum / 10 ^ 3)

# Creating the plot
png("plot4.png")
barplot(coalNEI$emissionsSum, 
        names.arg=coalNEI$year,
        xlab="Year",
        ylab="Total PM2.5 Emission (in kiloton)",
        main="Coal Combustion-Related Sources PM2.5 Emission - 1999 to 2008")
dev.off()