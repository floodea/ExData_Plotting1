plot2<-function(){
  if(!file.exists("data")){dir.create("data")}
  #fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
  #download.file(fileurl,destfile="./data/Fhousehold_power_consumption.zip") #method="curl" didn't work
  #unzip(zipfile="./data/Fhousehold_power_consumption.zip",exdir="./data")
  #Data<<-read.table(file="./data/Household_Power_consumption.txt",header=TRUE, sep=";",na.strings="?") #32bit laptop wont fread, sorry!
  Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")
  vv<<-rbind(Data[Data$Date=="2007-02-01",],Data[Data$Date=="2007-02-02",])
  vv$DateTime <- paste(vv$Date, vv$Time)
  vv$DateTime <- strptime(vv$DateTime, format = "%Y-%m-%d %H:%M:%S")
  png(file="plot2.png")
  with(vv,plot(vv$DateTime,vv$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
}