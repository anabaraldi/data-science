#libraries
library(dplyr)

# Reading and cleaning data
unzip("exdata-data-NEI_data.zip")

# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# The following code will filter the SCC file so we can subset the data with only the Motor Vehicle Source
# By definition Motor Vehicle sources are considered Onroad Category in USA
motorVehicleSCC <- filter(SCC, grepl("[Oo]nroad", SCC$Data.Category))

# The following code will filter only the Motor Vehicle Sources in Baltimore, then group the data by year 
# and take the sum for each year
motorVehicleNEI <- filter(NEI, SCC %in% motorVehicleSCC$SCC) %>%
    filter(fips == "24510") %>%
    group_by(year) %>%
    summarise(emissionsSum=sum(Emissions)) 

# Creating the plot
png("plot5.png")
barplot(motorVehicleNEI$emissionsSum, 
        names.arg=motorVehicleNEI$year,
        xlab="Year",
        ylab="Total PM2.5 Emission (in ton)",
        main="Motor Vehicle Sources PM2.5 Emission in Baltimore - 1999 to 2008")
dev.off()