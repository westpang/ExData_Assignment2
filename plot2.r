library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot1 <- aggregate(NEI[,c("Emissions")], by=list(NEI$year,NEI$fips), FUN=sum, na.rm=TRUE)
colnames(plot1) <- c("Year","Fips","Emissions")
plot2 <- subset(plot1,plot1$Fips == "24510")
barplot(plot2$Emissions, names.arg=plot2$Year,main=expression('Baltimore City, Maryland Total Emission of PM'[2.5]),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in tons')))

dev.copy(png,filename="plot2.png",width = 480, height = 480)
dev.off()
