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
png("plot3.png",width=480,height=480)

#print plot3 to file (line by line)
plot(dateTime,dfData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dateTime,dfData$Sub_metering_2,type="l",col="red")
lines(dateTime,dfData$Sub_metering_3,type="l",col="blue")

#adding legend to plot
legend("topright",col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save plot 
dev.off()

