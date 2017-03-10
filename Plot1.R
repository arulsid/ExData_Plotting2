# Exploratory Data Analysis - Assignment 2 - Question 1 "Plot 1"

# read the RDS source files -  NEI & summary files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# Aggregate Emission
EmissionAgg <- aggregate(Emissions ~ year, NEI, sum)

# Generate the plot in the source directory
png('plot1.png')
# To color the plot
pltClrs <- c("red", "blue", "green", "yellow")

barplot(EmissionAgg$Emissions, names.arg=EmissionAgg$year, 
        xlab="Years", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in Years'), col=pltClrs)

dev.off()

