Plot1<-function(){
  if(!file.exists("data")){dir.create("data")}#create data directory if it doesn't exist
  fileurl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")#file to download
  download.file(fileurl,destfile="./data/Fhousehold_power_consumption.zip") #Download the file (method="curl" didn't work).
  unzip(zipfile="./data/Fhousehold_power_consumption.zip",exdir="./data")#unzip file into directory
  Data<-read.table(file="./data/Household_Power_consumption.txt",header=TRUE, sep=";",na.strings="?") #Reading file into memory. 32bit laptop wont fread, sorry!
  Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")#coercing column 1 to date
  vv<-rbind(Data[Data$Date=="2007-02-01",],Data[Data$Date=="2007-02-02",])#extracting the two days required
  png(file="plot1.png")#opening plot device
  hist(vv$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)",xlim=c(0,6),ylim=c(0,1200))#plotting histogram
  dev.off()#closing plot device
}