# Read Data
emit_data<-readRDS("./explodata_project2/summarySCC_PM25.rds")


# Prepare plot data 1
plotdata1 <- aggregate(emit_data[c("Emissions")], list(year = emit_data$year), sum)

# Create Plot 1
png("./explodata_project2/Plot1.png")
plot(plotdata1$year,plotdata1$Emissions,type="l",main="Total Emissions from PM2.5 in US",xlab="Year",ylab="Emissions")

# Switch off device
dev.off()