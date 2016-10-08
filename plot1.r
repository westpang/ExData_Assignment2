library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot1 <- aggregate(NEI[,c("Emissions")], by=list(NEI$year), FUN=sum, na.rm=TRUE)
colnames(plot1) <- c("Year","Emissions")
barplot(plot1$Emissions/1000, names.arg=plot1$Year,main=expression('Total Emission of PM'[2.5]),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in kilotons')))

dev.copy(png,filename="plot1.png",width = 480, height = 480)
dev.off()
