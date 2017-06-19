# Author: Laura Plunkett
# Date: June 16, 2017
# Exploratory Data Anyalysis - Project 1 - Part 3

####################
# This file creates a line graph showing the three types of sub metering over over a 2-day period in February, 2007. 
####################

library(lubridate)

# Read in the data from the text file "household_power_consumption.txt" in the working directory. 
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert first column to date

data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset Data 

data <- subset(data, (data$Date>="2007-02-01"))
data <- subset(data, (data$Date<="2007-02-02"))

data$newdate <- with(data, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# Convert remaining columns to correct data types. 

for (i in 3:8){
     data[,i]<-as.numeric(as.character(data[,i]))
}

# plot line graph. 

plot(data$newdate,data$Sub_metering_1, type = "n",xlab =  "", ylab = "Energy sub metering")
lines(data$newdate,data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering")
lines(data$newdate,data$Sub_metering_2, type = "l", col = "red", ylab = "Energy sub metering")
lines(data$newdate,data$Sub_metering_3, type = "l", col = "blue", ylab = "Energy sub metering")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'),cex=.75)
dev.copy(png,'plot3.png')
dev.off()