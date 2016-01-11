################################################################################################
#	program: plot2.r
#	author:	Ian Aliman
#   	
################################################################################################
rm(list=ls())
setwd("~/R")
hhpower <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
hhpower$Date2 <- as.Date(hhpower$Date, "%d/%m/%Y")
hhpower$dt<- as.POSIXlt(paste(hhpower$Date2, hhpower$Time), format="%Y-%m-%d %H:%M:%S", tz="")

smallhh <- subset(hhpower, dt >= '2007-02-01 00:00:00')
smallhh <- subset(smallhh, dt <= '2007-02-02 23:59:59')


plot(smallhh$dt,smallhh$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )


png("plot2.png", width = 480, height = 480)
plot(smallhh$dt,smallhh$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
dev.off()

