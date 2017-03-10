# Exploratory Data Analysis - Assignment 2 - Question 5 "Plot5"
library(ggplot2)

# read the RDS source files -  NEI & summary files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Baltimore City, MD - fips == 24510 and Motor Vehicle source, type == 'ON-ROAD"
motorBaltimore <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

motorBaltimoreByYear <- aggregate(Emissions ~ year, motorBaltimore, sum)

# Generate the plot in the source directory
png('plot5.png')

g <- ggplot(motorBaltimoreByYear, aes(factor(year), Emissions, fill=year)) + 
  geom_bar(stat="identity") +
  xlab("Year") +   ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, MD from 1999 to 2008')
print(g)

dev.off()

