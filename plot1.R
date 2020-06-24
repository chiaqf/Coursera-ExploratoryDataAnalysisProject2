NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sum <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

## create the plot
png(filename = "plot1.png")
plot(sum$year, sum$x, type = "l", 
     main = "Total Emissions in United States",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()