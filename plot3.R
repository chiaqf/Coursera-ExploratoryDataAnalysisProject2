NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips=="24510")
baltimore_type_year <- aggregate(baltimore$Emissions, 
                                 by=list(baltimore$type, baltimore$year), 
                                 FUN=sum)
colnames(baltimore_type_year) <- c("Type", "Year", "Emissions")

library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = baltimore_type_year, color = Type, geom = "line") +
        ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
        ylab("Total Emissions (tons)") + 
        xlab("Year") 
dev.off()

        