plot1<-function(){
  if(!file.exists("data")){dir.create("data")}
  #fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
  #download.file(fileurl,destfile="./data/Fhousehold_power_consumption.zip") #method="curl" didn't work
  #unzip(zipfile="./data/Fhousehold_power_consumption.zip",exdir="./data")
  #Data<<-read.table(file="./data/Household_Power_consumption.txt",header=TRUE, sep=";",na.strings="?") #32bit laptop wont fread, sorry!
  Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")
  #vv<-subset(Data,Date=="2007-02-01" & Date=="2007-02-02")
  vv<<-rbind(Data[Data$Date=="2007-02-01",],Data[Data$Date=="2007-02-02",])
  png(file="plot1.png")
  hist(vv$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)",xlim=c(0,6),ylim=c(0,1200))
  dev.off()
  
}