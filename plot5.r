library(ggplot2)
library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot1 <- aggregate(NEI[,c("Emissions")], by=list(NEI$year,NEI$fips,NEI$type), FUN=sum, na.rm=TRUE)
colnames(plot1) <- c("Year","Fips","Type","Emissions")
plot2 <- subset(plot1,plot1$Fips == "24510"  & plot1$Type == "ON-ROAD")
plot5 <- plot2[,c("Year","Emissions")]

barplot(plot5$Emissions, names.arg=plot5$Year,main=expression('Baltimore City, Maryland Motor Vehicle Total Emission of PM'[2.5]),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in tons')))

dev.copy(png,filename="plot5.png",width = 480, height = 480)
dev.off()

