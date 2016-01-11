################################################################################################
#	program: plot3.r
#	author:	Ian Aliman
#   	
################################################################################################
rm(list=ls())
setwd("~/R")
hhpower <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
hhpower$Date2 <- as.Date(hhpower$Date, "%d/%m/%Y")
hhpower$dt<- as.POSIXlt(paste(hhpower$Date2, hhpower$Time), format="%Y-%m-%d %H:%M:%S", tz="", origin="1970-01-01")
tail()
smallhh <- subset(hhpower, dt >= '2007-02-01 00:00:00')
smallhh <- subset(smallhh, dt <= '2007-02-02 23:59:59')

smallhh$Sub_metering_1 <- as.numeric(as.character(smallhh$Sub_metering_1))
smallhh$Sub_metering_2 <- as.numeric(as.character(smallhh$Sub_metering_2))
smallhh$Global_active_power <-as.numeric(as.character(smallhh$Global_active_power))


png("plot3.png", width = 480, height = 480)
plot(smallhh$dt,smallhh$Sub_metering_1, xaxt="n", ylim=range(0,40), type="l", xlab="", ylab="Energy Sub Metering", yaxt="n")
par(new=T)
plot(smallhh$dt, smallhh$Sub_metering_2, xaxt="n", ylim=range(0,35), yaxt="n", type="l", col="red", ylab="", xlab="")
par(new=T)
plot(smallhh$dt, smallhh$Sub_metering_3, xaxt="n", ylim=range(0,35), yaxt="n", type="l", col="blue", ylab="", xlab="")
axis(side=2, at=c(0,10,20,30))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"),lty=c(1,1,1), lwd=c(2,2,2))
dev.off()
