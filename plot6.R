## read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset data
balt_LA_data <- subset(NEI, NEI$fips=="24510" |
                                  NEI$fips=="06037" &
                                  NEI$type=="ON-ROAD")
balt_LA_year <- aggregate(balt_LA_data$Emissions, 
                             by=list(balt_LA_data$fips, balt_LA_data$year),
                             FUN=sum)
colnames(balt_LA_year) <- c("City", "Year", "Emissions")

## create plot 
library(ggplot2)
png(filename = "plot6.png")
p<-qplot(Year, Emissions, data = balt_LA_year, color = City, geom = "line") +
        ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)") + 
        ylab("Total Emissions from motor vehicles (tons)") + 
        xlab("Year")
print(p) #for some reason it only produce .png file after this statement
dev.off()
