## This script creates a histogram of 'Global Active Power' 
## over the two day period from 2/1/07-2/2/07

library(sqldf)

## Read and format the data
data<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
data$Date<-as.Date(x$Date)

## Create the plot file
png(file="plot1.png", width = 480, height = 480, units = "px")

## Create and annotate the histogram
hist(x$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency", col="red")

## Close the file device
dev.off()