library(ggplot2)
library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot1 <- aggregate(NEI[,c("Emissions")], by=list(NEI$year,NEI$fips,NEI$type), FUN=sum, na.rm=TRUE)
colnames(plot1) <- c("Year","Fips","Type","Emissions")
plot2 <- subset(plot1,plot1$Fips == "24510")
plot3 <- plot2[,c("Year","Type","Emissions")]

ggplot(plot3,aes(x=Year,y=Emissions,color=Type))+geom_line()+ggtitle(expression('Baltimore City, Maryland Total Emission of PM'[2.5]))+labs(x="Year",y=expression(paste('PM', ''[2.5], ' in tons')))

dev.copy(png,filename="plot3.png",width = 480, height = 480)
dev.off()
