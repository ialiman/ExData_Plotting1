################################################################################################
#	program: plot1.r
#	author:	Ian Aliman
#   	
################################################################################################
rm(list=ls())
setwd("~/R")
hhpower <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

hhpower$Date <- as.Date(hhpower$Date, "%d/%m/%Y")
hhpower$Time <- strptime(hhpower$Time, format="%X")

smallhh <- subset(hhpower, Date=="2007-02-01" | Date=="2007-02-02")
smallerhh <- subset(smallhh, Global_active_power != '?') #junk code
smallerhh$histset <-as.numeric(as.character(smallhh$Global_active_power))
hist(as.numeric(smallerhh$histset), main="Global Active Power", col="red", ylab="Frequency", freq=TRUE, nclass=15,  xlab='Global Active Power (kilowatts)')

png("plot1.png", width = 480, height = 480)
hist(as.numeric(smallerhh$histset), main="Global Active Power", col="red", ylab="Frequency", freq=TRUE, nclass=15,  xlab='Global Active Power (kilowatts)')

dev.off()
