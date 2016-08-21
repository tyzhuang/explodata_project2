# read data
emit_data<-readRDS("./explodata_project2/summarySCC_PM25.rds")

# Plot Data 3
baltimore<-subset(emit_data,fips=="24510")
plotdata3 <- aggregate(baltimore[c("Emissions")], list(Type = baltimore$type,Year=baltimore$year), sum)

# Create Plot 3
png("./explodata_project2/Plot3.png")
plot3<-ggplot(plotdata3,aes(x=Year,y=Emissions,colour=Type)) +
       geom_point(alpha=.3)+geom_smooth(alpha=.3,size=1,method="loess")+
       ggtitle("Total Emissions By Sources In Baltimore City")
print(plot3)

# Switch off device
dev.off()