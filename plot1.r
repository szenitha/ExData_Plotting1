#filename<-"C:\\Users\\zenit\\Downloads\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt"

library(data.table)
#read file and replace NA values with symbol ?
input_file<-fread(file.choose(),na.strings = "?")
#Concatenate dat and time and store it in proper format
input_file[,DateTime:=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

library(dplyr)
#Pick only records in the 2 day period between 01.02.2007 to 03.02.2007(up till 03.02.2007 00:00:00 hrs)
data=filter(input_file,DateTime>="2007-02-01 00:00:00",DateTime<="2007-02-03 00:00:00")

#Plot 1: construct histogram
hist(data$Global_active_power,col="red",xlab="Global Active Power(killowatts)",ylab="Frequency",main="Global Active Power")

#save plot
png("D:/plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",xlab="Global Active Power(killowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
