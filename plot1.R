##install if need
##install.packages("sqldf")
##install.packages("chron")
library(sqldf)
library(chron)

## Read partial data from file by course condition
dataFile<-"./household_power_consumption.txt"
dataQuery<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(dataFile,dataQuery)

##convert Date and Time fields.
dfData$Date<-as.Date(dfData$Date,"%d/%m/%Y")
dfData$Time<-chron(times=dfData$Time)

#print histogram
hist(dfData$Global_active_power,main="Global Active Power", col = 'red', xlab="Global Active Power (kilowatts)")

#save plot as PNG-file
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
