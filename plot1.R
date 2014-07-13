library(sqldf)
library(chron)

## Read partial data from file by course condition
dataFile<-"./household_power_consumption.txt"
dataQuery<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(dataFile,dataQuery)

#open PNG-device
png("plot1.png",width=480,height=480)

#print histogram to PNG-device
hist(dfData$Global_active_power,main="Global Active Power", col = 'red', xlab="Global Active Power (kilowatts)")

#save plot
dev.off()
