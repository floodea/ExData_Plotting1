plot3<-function(){
  if(!file.exists("data")){dir.create("data")}#create directory if not present
  fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")#file to download
  download.file(fileurl,destfile="./data/Fhousehold_power_consumption.zip") #downloading file. method="curl" didn't work
  unzip(zipfile="./data/Fhousehold_power_consumption.zip",exdir="./data")#unzipping file into the directory
  Data<-read.table(file="./data/Household_Power_consumption.txt",header=TRUE, sep=";",na.strings="?") #reading file into R. 32bit laptop wont fread, sorry!
  Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")#coercing date
  vv<-rbind(Data[Data$Date=="2007-02-01",],Data[Data$Date=="2007-02-02",])#subsetting days
  vv$DateTime <- paste(vv$Date, vv$Time)#combining date and time
  vv$DateTime <- strptime(vv$DateTime, format = "%Y-%m-%d %H:%M:%S")#formatting date and time
  png(file="plot3.png")#opening graphics device
  with(vv,plot(vv$DateTime,vv$Sub_metering_1,type="n",xlab="", ylab="Global Active Power (kilowatts)"))#building plot
  with(vv,lines(vv$DateTime,vv$Sub_metering_1,col="black"))
  with(vv,lines(vv$DateTime,vv$Sub_metering_2,col="red"))#adding plots
  with(vv,lines(vv$DateTime,vv$Sub_metering_3,col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))#adding legend
  dev.off()#closing graphics device
}