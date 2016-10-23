setwd("/Users/arturo/Dropbox/Coursera/data/Exploratory Data Analysis/week1/quizz")
f<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings = "?")
f$Date<-as.Date(f$Date, "%d/%m/%Y")
power<-subset(f,f$Date=="2007-02-01" | f$Date=="2007-02-02")
power<-cbind(power,as.POSIXlt(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S"))
colnames(power)[10]<-"time"
power<-subset(power,select = c(10,1:9))
#4
if (!file.exists("plot4.png")){
        png(filename = "plot4.png",width = 480, height = 480)
        par(mfrow=c(2,2))
        plot(power$time,power$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "l")
        plot(power$time,power$Voltage,xlab = "datetime",ylab = "voltage",type = "l")
        plot(power$time,power$Sub_metering_1,ylab="energy sub metering",xlab = "",type = "l")
        lines(power$time,power$Sub_metering_2,col="red")
        lines(power$time,power$Sub_metering_3, col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = .6)
        plot(power$time,power$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
        dev.off()
}
