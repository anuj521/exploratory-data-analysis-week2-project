## Verify the existance of NEI and SCC variables
if(!exists("NEI")){
  NEI <- readRDS("./Data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Data/Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggrTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggrTotalByYear$Emissions, names.arg=aggrTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()