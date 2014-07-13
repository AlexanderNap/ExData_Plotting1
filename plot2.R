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
png("plot2.png",width=480,height=480)

#print plot2 to PNG-device
plot(dateTime, dfData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#save plot
dev.off()