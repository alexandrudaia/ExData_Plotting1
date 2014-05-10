plot3=function()
{ setwd("C:/Users/Home/Desktop")
  df = read.table("household.txt", header=T, sep=';')
  df$Date = as.Date(df$Date, format ="%d/%m/%Y")
  df1=df[df$Global_active_power!="?",]
  d=df1[df1$Date=="2007-02-01"|df1$Date=="2007-02-02",]
  global_active_power=as.numeric(type.convert(as.character(d$Global_active_power), dec = "."))
  a=paste(d$Date,d$Time)
  t=as.POSIXct(strptime(a, "%Y-%m-%d %H:%M:%S"))
  Sub_metering_1=as.numeric(type.convert(as.character(d$Sub_metering_1), dec = "."))
  plot(t, d$Sub_metering_3, type="l", xlab="", ylab="Global Active Power (kilowatts)",axes=T,ylim=c(0,30),col="blue")
  par(new=T)
  lines(t, as.numeric(as.character(d$Sub_metering_2)), type = "l", col = "red")
  par(new=T)
  plot(t, Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)",axes=F, )
  
  legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot3=dev.copy(png, 'plot3.png')
}
