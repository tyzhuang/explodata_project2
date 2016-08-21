# read data
emit_data<-readRDS("./explodata_project2/summarySCC_PM25.rds")

# Plot Data 2
baltimore<-subset(emit_data,fips=="24510")
plotdata2 <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year), sum)

# Create Plot 2
png("./explodata_project2/Plot2.png")
plot(plotdata2$year,plotdata2$Emissions,type="l",main="Total Emissions From PM2.5 Decreased In Baltimore City",xlab="Year",ylab="Emissions")

# Switch off device
dev.off()