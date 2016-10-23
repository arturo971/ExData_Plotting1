setwd("/Users/arturo/Dropbox/Coursera/data/Exploratory Data Analysis/week1/quizz")
f<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings = "?")
f$Date<-as.Date(f$Date, "%d/%m/%Y")
power<-subset(f,f$Date=="2007-02-01" | f$Date=="2007-02-02")
power<-cbind(power,as.POSIXlt(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S"))
colnames(power)[10]<-"time"
power<-subset(power,select = c(10,1:9))
#3
if (!file.exists("plot3.png")){
        png(filename = "plot3.png",width = 480, height = 480)
        plot(power$time,power$Sub_metering_1,ylab="energy sub metering",xlab = "",type = "l")
        lines(power$time,power$Sub_metering_2,col="red")
        lines(power$time,power$Sub_metering_3, col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        dev.off()
}