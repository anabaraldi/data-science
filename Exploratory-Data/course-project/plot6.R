#libraries
library(dplyr)
library(ggplot2)

# Reading and cleaning data
unzip("exdata-data-NEI_data.zip")

# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# The following code will filter the SCC file so we can subset the data with only the Motor Vehicle Source
# By definition Motor Vehicle sources are considered Onroad Category in USA
motorVehicleSCC <- filter(SCC, grepl("[Oo]nroad", SCC$Data.Category))

# The following code will filter only the Motor Vehicle Sources in Baltimore and Los Angeles, then group the data by year 
# and take the sum for each year
motorVehicleNEI <- filter(NEI, SCC %in% motorVehicleSCC$SCC) %>%
    filter(fips %in% c("24510", "06037")) %>%
    mutate(fips = factor(fips, levels=c("24510", "06037"), labels=c("Baltimore", "Los Angeles"))) %>% 
    group_by(year, fips) %>%
    summarise(emissionsSum=sum(Emissions)) 

# Creating the plot
png("plot6.png")
ggplot(motorVehicleNEI, aes(year, emissionsSum, color=fips)) + 
    geom_smooth() +
    xlab("Year") +
    ylab("Total PM2.5 Emission (in ton)") +
    ggtitle("Motor Vehicle Sources PM2.5 Emission\n in Baltimore and Los Angeles - 1999 to 2008")
dev.off()
