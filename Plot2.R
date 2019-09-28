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

#7. Assign DateTime to variable
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#7. Create png file and assign historgram
png("plot2.png", width = 480, height = 480)
plot(datetime,globalActivePower,type="l", ylab="Global Active Power (kilowatts)")
dev.off()