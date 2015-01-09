plot4<-function(){
  #fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
  #download.file(fileurl,destfile="./data/Fhousehold_power_consumption.zip") #method="curl" didn't work
  #unzip(zipfile="./data/Fhousehold_power_consumption.zip",exdir="./data")
  #Data<<-read.table(file="./data/Household_Power_consumption.txt",header=TRUE, sep=";",na.strings="?") #32bit laptop wont fread, sorry!
  Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")
  #vv<<-rbind(Data[Data$Date=="2007-02-01",],Data[Data$Date=="2007-02-02",])
  vv$DateTime <- paste(vv$Date, vv$Time)
  vv$DateTime <- strptime(vv$DateTime, format = "%Y-%m-%d %H:%M:%S")
  png(file="plot4.png")
  par(mfcol=c(2,2))
  with(vv,plot(vv$DateTime,vv$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))
  with(vv,plot(vv$DateTime,vv$Sub_metering_1,type="n",xlab="", ylab="Global Active Power (kilowatts)"))
  with(vv,lines(vv$DateTime,vv$Sub_metering_1,col="black"))
  with(vv,lines(vv$DateTime,vv$Sub_metering_2,col="red"))
  with(vv,lines(vv$DateTime,vv$Sub_metering_3,col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
  with(vv,plot(vv$DateTime,vv$Voltage,col="black",type="l",xlab="datetime",ylab="Voltage"))
  with(vv,plot(vv$DateTime,vv$Global_reactive_power,col="black",type="l",xlab="datetime",ylab="Global_reactive_power"))
  dev.off()
}