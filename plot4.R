plot4<-function(){
  if(!file.exists("data")){dir.create("data")}#create directory if not present
  fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")#file to download
  download.file(fileurl,destfile="./data/Fhousehold_power_consumption.zip") #Download file, method="curl" didn't work
  unzip(zipfile="./data/Fhousehold_power_consumption.zip",exdir="./data")#unzip file into directory
  Data<-read.table(file="./data/Household_Power_consumption.txt",header=TRUE, sep=";",na.strings="?") #Read file into R32bit laptop wont fread, sorry!
  Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")#coerce to date
  vv<-rbind(Data[Data$Date=="2007-02-01",],Data[Data$Date=="2007-02-02",])#subset required dates
  vv$DateTime <- paste(vv$Date, vv$Time)#combine date and time in column
  vv$DateTime <- strptime(vv$DateTime, format = "%Y-%m-%d %H:%M:%S")#format date and time
  png(file="plot4.png")#open graphics device
  par(mfcol=c(2,2))#set graph layout (fill by column)
  with(vv,plot(vv$DateTime,vv$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))#add the plots
  with(vv,plot(vv$DateTime,vv$Sub_metering_1,type="n",xlab="", ylab="Global Active Power (kilowatts)"))
  with(vv,lines(vv$DateTime,vv$Sub_metering_1,col="black"))
  with(vv,lines(vv$DateTime,vv$Sub_metering_2,col="red"))
  with(vv,lines(vv$DateTime,vv$Sub_metering_3,col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")#add legend to one of the plots
  with(vv,plot(vv$DateTime,vv$Voltage,col="black",type="l",xlab="datetime",ylab="Voltage"))
  with(vv,plot(vv$DateTime,vv$Global_reactive_power,col="black",type="l",xlab="datetime",ylab="Global_reactive_power"))
  dev.off()#close graphics device
}