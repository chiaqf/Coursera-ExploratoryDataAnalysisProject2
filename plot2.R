NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips=="24510")
baltimore_year <- aggregate(baltimore$Emissions, by=list(baltimore$year), 
                                 FUN=sum)
png(filename = "plot2.png")
plot(baltimore_year$Group.1, baltimore_year$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", 
     ylab = "Total Emissions (tons)")
dev.off()
