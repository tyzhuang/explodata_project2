# Read Data
emit_data<-readRDS("./explodata_project2/summarySCC_PM25.rds")
source<-readRDS("./explodata_project2/Source_Classification_Code.rds")

# Create Plot Data 4
code<- grep("coal",source$EI.Sector,value=TRUE,ignore.case = TRUE)
source_code<-subset(source,source$EI.Sector %in% code,select=SCC)
emit_code<-subset(emit_data,emit_data$SCC %in% source_code$SCC)
plotdata4 <- aggregate(emit_code[c("Emissions")], list(Year=emit_code$year,Type=emit_code$type), sum)

# Create Plot 4
png("./explodata_project2/Plot4.png")
plot4<-ggplot(plotdata4,aes(x=Year,y=Emissions,color=Type)) +
  geom_point(alpha=.3)+geom_smooth(alpha=.3,size=1)+
  ggtitle("Total Emissions From Coal Combustion-Related Sources In US")
print(plot4)

# Switch off device
dev.off()