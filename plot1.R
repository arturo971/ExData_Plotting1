setwd("/Users/arturo/Dropbox/Coursera/data/Exploratory Data Analysis/week1/quizz")
f<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings = "?")
f$Date<-as.Date(f$Date, "%d/%m/%Y")
power<-subset(f,f$Date=="2007-02-01" | f$Date=="2007-02-02")
power<-cbind(power,as.POSIXlt(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S"))
colnames(power)[10]<-"time"
power<-subset(power,select = c(10,1:9))
#1
if (!file.exists("plot1.png")){
        png(filename = "plot1.png",width = 480, height = 480)
        hist(power$Global_active_power, main = "global active power",xlab = "kilowatts",col = "red")
        dev.off()
}
