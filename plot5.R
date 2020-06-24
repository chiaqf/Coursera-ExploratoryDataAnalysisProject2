## read in emissions data and classification code
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset data from Baltimore City from type "on road"
baltimore_data <- subset(NEI, NEI$fips=="24510" 
                         & NEI$type=="ON-ROAD")
baltimore_car_year <- aggregate(baltimore_data$Emissions, 
                                by=list(baltimore_data$year), FUN=sum)
colnames(baltimore_car_year) <- c("Year", "Emissions")

## create plot
png(filename = "plot5.png")
plot(baltimore_car_year$Year, baltimore_car_year$Emissions,
     type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 (mtr vehicles) in Baltimore City")
dev.off()



