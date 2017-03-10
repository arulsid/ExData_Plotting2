# Exploratory Data Analysis - Assignment 2 - Question 3 "Plot3"
library(ggplot2)

# read the RDS source files -  NEI & summary files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Get subset for Baltimore (fips = 24510)
subsetNEI  <- NEI[NEI$fips=="24510", ]

# Aggregte the emission year data for Baltimore Ciy
EmissionAgg <- aggregate(Emissions ~ year + type, subsetNEI, sum)

# Generate the plot in the source directory
png('plot3.png')

g <- ggplot(EmissionAgg, aes(year, Emissions, color = type)) + geom_line() +
  xlab("/year") +   ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, MD from 1999 to 2008')
print(g)

dev.off()

