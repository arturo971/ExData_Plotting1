setwd("/Users/arturo/Dropbox/Coursera/data/Exploratory Data Analysis/week1/quizz")
f<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings = "?")
f$Date<-as.Date(f$Date, "%d/%m/%Y")
power<-subset(f,f$Date=="2007-02-01" | f$Date=="2007-02-02")
power<-cbind(power,as.POSIXlt(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S"))
colnames(power)[10]<-"time"
power<-subset(power,select = c(10,1:9))
#2
if (!file.exists("plot2.png")){
        png(filename = "plot2.png",width = 480, height = 480)
        plot(power$time,power$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "l")
        dev.off()
}