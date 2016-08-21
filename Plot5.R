# Read Data
emit_data<-readRDS("./explodata_project2/summarySCC_PM25.rds")
source<-readRDS("./explodata_project2/Source_Classification_Code.rds")

# Create Plot Data 5
baltimore<-subset(emit_data,fips=="24510")
code<- grep("vehicle",source$EI.Sector,value=TRUE,ignore.case = TRUE)
source_code<-subset(source,source$EI.Sector %in% code,select=SCC)
emit_code<-subset(baltimore,baltimore$SCC %in% source_code$SCC)
plotdata5 <- aggregate(emit_code[c("Emissions")], list(Year=emit_code$year), sum)

# Create Plot 5
png("./explodata_project2/Plot5.png")
plot(plotdata5$Year,plotdata5$Emissions,type="l",main="Total Emissions From Motor Vehicles In Baltimore",xlab = "Year",ylab="Emissions")

# Switch off device
dev.off()