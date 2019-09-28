#1.Get working directory
getwd()

#2.Set working directory
setwd("C:/Users/Razi/Documents/Razi")

#3.Assign file to variable
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#4.Check first 5 rows
head(data)

#5.Filter data by the two dates
data1 <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

#6. Assign variables
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data1$Global_active_power)
globalReactivePower <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
submeter1 <- as.numeric(data1$Sub_metering_1)
submeter2 <- as.numeric(data1$Sub_metering_2)
submeter3 <- as.numeric(data1$Sub_metering_3)

#7. Create png file and assign plot
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#Global Active Power
plot(datetime,globalActivePower, type="l", xlab="",ylab="Global Active Power")

#Voltage
plot(datetime, voltage, type="l", xlab="",ylab="Voltage")

#Energy Submetering
plot(datetime,submeter1,type="l", ylab="Energy Submetering",xlab="")
lines(datetime,submeter2,type="l",col="red")
lines(datetime,submeter3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))

#Global Reactive Power
plot(datetime, globalReactivePower, type="l", xlab="",ylab="Global_reactive_power")
dev.off()