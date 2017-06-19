# Author: Laura Plunkett
# Date: June 16, 2017
# Exploratory Data Anyalysis - Project 1 - Part 1

####################
# This file creates a histogram of global activepower in kilowatts over over a 2-day period in February, 2007. 
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

# plot histogram. breaks are default. 

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png,'plot1.png')
dev.off()

