## read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## fetch coal records
coal_scc <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_nei <- NEI[NEI$SCC %in% coal_scc$SCC, ]

## sum up emissions by year
coal_emission_year <- aggregate(coal_nei$Emissions, 
                                 by=list(coal_nei$year), FUN=sum)
colnames(coal_emission_year) <- c("year", "emissions")

## plot
png(filename = "plot4.png")
plot(coal_emission_year$year, coal_emission_year$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Emissions from coal combustion of PM2.5 in United States from 1999-2008")
dev.off()


