#filename<-"C:\\Users\\zenit\\Downloads\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt"

library(data.table)
#read file and replace NA values with symbol ?
input_file<-fread(file.choose(),na.strings = "?")
#Concatenate dat and time and store it in proper format
input_file[,DateTime:=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

library(dplyr)
#Pick only records in the 2 day period between 01.02.2007 to 03.02.2007(up till 03.02.2007 00:00:00 hrs)
data=filter(input_file,DateTime>="2007-02-01 00:00:00",DateTime<="2007-02-03 00:00:00")

#plot 4
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",xlab = " ",ylab="Global Active Power (killowatts)")
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
with(data,
     {
       plot(data$DateTime,data$Sub_metering_1,col="black",type="l",xlab=" ",ylab="Energy Sub metering")
       #axis(side=2,at=c(0,10,20,30))
       lines(data$DateTime,data$Sub_metering_2,col="red",type="l")
       lines(data$DateTime,data$Sub_metering_3,col="blue",type="l")
       legend("topright",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
       
     }
)
plot(data$DateTime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
#dev.off()

#save plot 4
png("D:/plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#sub plot 1
plot(data$DateTime,data$Global_active_power,type="l",xlab = " ",ylab="Global Active Power (killowatts)")
#subplot 2
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
#sub plot 3
with(data,
     {
       plot(data$DateTime,data$Sub_metering_1,col="black",type="l",xlab=" ",ylab="Energy Sub metering")
       #axis(side=2,at=c(0,10,20,30))
       lines(data$DateTime,data$Sub_metering_2,col="red",type="l")
       lines(data$DateTime,data$Sub_metering_3,col="blue",type="l")
       legend("topright",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
       
     }
)
#sub plot 4
plot(data$DateTime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
#dev.off()
dev.off()

