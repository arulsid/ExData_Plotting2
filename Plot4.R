# Exploratory Data Analysis - Assignment 2 - Question 4 "Plot4"
library(ggplot2)

# read the RDS source files -  NEI & summary files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related sources changed 
# from 1999-2008?

# Get Coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge SCC Coal data with NEC
mergeNEISCC <- merge(NEI, SCC.coal, by='SCC')

coalEmissbyYear <- aggregate(Emissions ~ year, mergeNEISCC, sum)

# Generate the plot in the source directory
png('plot4.png')

g <- ggplot(coalEmissbyYear, aes(factor(year), Emissions, fill=year)) + geom_bar(stat="identity") +
  xlab("Year") +   ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)

dev.off()

