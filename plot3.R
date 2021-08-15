powerConsumption<-read.table("household_power_consumption.txt",na.strings = "?",sep =";" ,header = T)
powerConsumption$Date<-as.Date(powerConsumption$Date,format = "%d/%m/%Y")
powerConsumption<-subset(powerConsumption,Date == "2007-02-01" | Date == "2007-02-02" )
powerConsumption$Date<-paste(powerConsumption$Date,powerConsumption$Time)
powerConsumption$Date<-strptime(powerConsumption$Date,"%Y-%m-%d %H:%M:%S")
png(filename = "plot3.png",width = 480,height = 480)
plot(powerConsumption$Date,powerConsumption$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(powerConsumption$Date,powerConsumption$Sub_metering_2,col="red")
lines(powerConsumption$Date,powerConsumption$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()



