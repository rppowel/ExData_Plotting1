## This script creates a plot of 'Global Active Power' 
## over the two day period from 2/1/07-2/2/07

library(sqldf)

## Read and format the data
data<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
data$Datetime<-paste(data$Date,data$Time)
data$Datetime<-strptime(data$Datetime,"%d/%m/%Y %H:%M:%S")

## Create the plot file
png(file="plot2.png", width = 480, height = 480, units = "px")

## Create and annotate the plot
plot(data$Datetime, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Close the file device
dev.off()