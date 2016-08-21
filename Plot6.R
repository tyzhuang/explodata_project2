# Read Data
emit_data<-readRDS("./explodata_project2/summarySCC_PM25.rds")
source<-readRDS("./explodata_project2/Source_Classification_Code.rds")

# Create Plot Data 6
baltimore_LA<-subset(emit_data,fips=="24510"|fips=="06037")
code<- grep("vehicle",source$EI.Sector,value=TRUE,ignore.case = TRUE)
source_code<-subset(source,source$EI.Sector %in% code,select=SCC)
emit_code<-subset(baltimore_LA,baltimore_LA$SCC %in% source_code$SCC)
plotdata6 <- aggregate(emit_code[c("Emissions")], list(fips=emit_code$fips,Year=emit_code$year), sum)
# replace fips to name
plotdata6$city <- rep(NA, nrow(plotdata6))
plotdata6[plotdata6$fips == "06037", ][, "city"] <- "Los Angeles"
plotdata6[plotdata6$fips == "24510", ][, "city"] <- "Baltimore"

# Create Plot 6
png("./explodata_project2/Plot6.png")
plot6<-ggplot(plotdata6,aes(x=Year,y=Emissions,colour=city)) +
  geom_point(alpha=.3)+geom_smooth(alpha=.3,size=1,method="loess")+
  ggtitle("Emissions By Motor Vehicles: Baltimore VS Los Angeles")
print(plot6)

# Switch off device
dev.off()