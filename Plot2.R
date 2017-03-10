# Exploratory Data Analysis - Assignment 2 - Question 2 "Plot2"

# read the RDS source files -  NEI & summary files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Get the subset dat for Baltimore City
subsetNEI  <- NEI[NEI$fips=="24510", ]

# Aggregte the emission year data for Baltimore Ciy
EmissionAgg <- aggregate(Emissions ~ year, subsetNEI, sum)

# Generate the plot in the source directory
png('plot2.png')
# To color the plot
pltClrs <- c("red", "blue", "green", "yellow")

barplot(EmissionAgg$Emissions, names.arg=EmissionAgg$year, 
        xlab="Years", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in Years in Baltimore City, MD'),col=pltClrs)

dev.off()

