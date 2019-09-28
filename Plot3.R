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

#6. Assign Global Activ Power to variable
globalActivePower <- as.numeric(data1$Global_active_power)

#7. Assign Submetering variables
submeter1 <- as.numeric(data1$Sub_metering_1)
submeter2 <- as.numeric(data1$Sub_metering_2)
submeter3 <- as.numeric(data1$Sub_metering_3)

#7. Create png file and assign plot
png("plot3.png", width = 480, height = 480)
plot(datetime,submeter1,type="l", ylab="Energy Submetering",xlab="")
lines(datetime,submeter2,type="l",col="red")
lines(datetime,submeter3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
dev.off()