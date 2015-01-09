plot2<-function(){
  if(!file.exists("data")){dir.create("data")}#create directory if not present
  fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")#filename to download
  download.file(fileurl,destfile="./data/Fhousehold_power_consumption.zip") #download the file (method="curl" didn't work)
  unzip(zipfile="./data/Fhousehold_power_consumption.zip",exdir="./data")#Unzip the file
  Data<-read.table(file="./data/Household_Power_consumption.txt",header=TRUE, sep=";",na.strings="?") #read the file into R. Fread won't work ont he 32bit laptop.
  Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")#coercing the date column
  vv<-rbind(Data[Data$Date=="2007-02-01",],Data[Data$Date=="2007-02-02",])#selecting the required days
  vv$DateTime <- paste(vv$Date, vv$Time)#combining the date and time
  vv$DateTime <- strptime(vv$DateTime, format = "%Y-%m-%d %H:%M:%S")#formatting using strptime
  png(file="plot2.png")#optning graphics device
  with(vv,plot(vv$DateTime,vv$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))#plotting 
  dev.off()#closing graphics device
}