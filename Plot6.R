# Exploratory Data Analysis - Assignment 2 - Question 6 "Plot6"
library(ggplot2)

# read the RDS source files -  NEI & summary files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
# sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?

# Baltimore City, MD - fips == 24510 and Motor Vehicle source, type == 'ON-ROAD"
motorBaltimore <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
# Los Angeles County, CA - fips == 06037 and Motor Vehicle source, type == 'ON-ROAD"
motorLA <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# combine both the Baltimore & LA into one Dataframe
combineDF <- as.data.frame(rbind(motorBaltimore, motorLA))

# aggregate the combined data frame by year and fips
aggByYearandFips <- aggregate(Emissions ~ year + fips, combineDF, sum)
# replace FIPS values with the names
aggByYearandFips$fips[aggByYearandFips$fips=="24510"] <- "Baltimore, MD"
aggByYearandFips$fips[aggByYearandFips$fips=="06037"] <- "Los Angeles, CA"

# Generate the plot in the source directory
png('plot6.png')

g <- ggplot(aggByYearandFips, aes(factor(year), Emissions, fill=year)) + 
  facet_grid(. ~ fips) + geom_bar(stat="identity") +
  xlab("Year") +   ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, MD vs Los Angeles, CA from 1999 to 2008')
print(g)

dev.off()

