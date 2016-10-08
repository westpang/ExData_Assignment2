library(ggplot2)
library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot1 <- aggregate(NEI[,c("Emissions")], by=list(NEI$year,NEI$fips,NEI$type), FUN=sum, na.rm=TRUE)
colnames(plot1) <- c("Year","Fips","Type","Emissions")
plot2 <- subset(plot1,plot1$Fips == "24510" & plot1$Type == "ON-ROAD")
plot3 <- subset(plot1,plot1$Fips == "06037" & plot1$Type == "ON-ROAD")
plot6 <- rbind(plot2,plot3)

plot6$Fips[plot6$Fips=="24510"] <- "Baltimore City"
plot6$Fips[plot6$Fips=="06037"] <- "Los Angeles County"

ggplot(plot6, aes(factor(Year), Emissions))+facet_grid(. ~ Fips)+geom_bar(stat="identity")  +
  labs(x="Year",y=expression(paste('PM', ''[2.5], ' in tons')))+ggtitle(expression('Baltimore City & Los Angeles Country Motor Vehicle Total Emission of PM'[2.5]))

dev.copy(png,filename="plot6.png",width = 480, height = 480)
dev.off()
