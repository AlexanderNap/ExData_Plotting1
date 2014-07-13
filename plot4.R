library(sqldf)
library(chron)

## Read partial data from file by course condition
dataFile<-"./household_power_consumption.txt"
dataQuery<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(dataFile,dataQuery)

##convert Date and Time fields.
dateTime <- strptime(paste(dfData$Date,dfData$Time), format="%d/%m/%Y %H:%M:%S")

##if need to print weekdays in English 
Sys.setlocale("LC_TIME", "C")

#open PNG-device
png("plot4.png",width=480,height=480)

#set numbers of plot on screen
par(mfrow = c(2,2))

#plot (1,1) - "Global Active Power (kilowatts)"
plot(dateTime, dfData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#plot(1,2) - "Voltage"
plot(dateTime,dfData$Voltage,type="l",ylab="Voltage", xlab="dateTime")

#plot (2,1) - "Energy sub metering"
plot(dateTime,dfData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dateTime,dfData$Sub_metering_2,type="l",col="red")
lines(dateTime,dfData$Sub_metering_3,type="l",col="blue")
#adding legend to plot without box
legend("topright",col = c("black", "red", "blue"), lty= "solid", bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot (2,2) - "Global_reactive_power"
plot(dateTime,dfData$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="dateTime")

dev.off()