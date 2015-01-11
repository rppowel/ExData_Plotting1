## This script creates a plot of 'Energy Sub Metering' 
## over the two day period from 2/1/07-2/2/07

library(sqldf)

## Read and format the data
data<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
data$Datetime<-paste(data$Date,data$Time)
data$Datetime<-strptime(data$Datetime,"%d/%m/%Y %H:%M:%S")

## Create the plot file
png(file="plot4.png", width = 480, height = 480, units = "px")

## Format the plot area to have 4 plots
par(mfrow=c(2,2))

## Create and annotate the plots
### Create the Global Active Power plot
plot(data$Datetime, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
### Create the Voltage plot
plot(data$Datetime, data$Voltage,type="l",xlab="datetime",ylab="Voltage")
### Create the Energy sub metering plot
plot(data$Datetime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$Datetime,data$Sub_metering_1)
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")
legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,"red","blue"),lty=c(1,1,1))
### Create the 'Global Reactive Power' plot
plot(data$Datetime, data$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")

## Close the file device
dev.off()