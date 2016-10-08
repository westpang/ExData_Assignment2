library(ggplot2)
library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")
NEISCC.coal <- NEISCC[grep("coal",NEISCC$Short.Name,ignore.case=TRUE),]

plot4 <- aggregate(NEISCC.coal[,c("Emissions")], by=list(NEISCC.coal$year), FUN=sum, na.rm=TRUE)
colnames(plot4) <- c("Year","Emissions")

ggplot(plot4,aes(x=Year,y=Emissions))+geom_line()+ggtitle(expression('USA Total Emission of PM'[2.5]))+labs(x="Year",y=expression(paste('PM', ''[2.5], ' in tons')))

dev.copy(png,filename="plot4.png",width = 480, height = 480)
dev.off()
