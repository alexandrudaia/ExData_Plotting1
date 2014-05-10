plot4=function()
  {
   setwd("C:/Users/Home/Desktop")
  
   par(mfrow = c(2, 2))
   source("plot2.R")
   plot2()
   df = read.table("household.txt", header=T, sep=';')
   df$Date = as.Date(df$Date, format ="%d/%m/%Y")
   df1=df[df$Global_active_power!="?",]
   d=df1[df1$Date=="2007-02-01"|df1$Date=="2007-02-02",]
   global_active_power=as.numeric(type.convert(as.character(d$Global_active_power), dec = "."))
   a=paste(d$Date,d$Time)
   t=as.POSIXct(strptime(a, "%Y-%m-%d %H:%M:%S"))
   voltage=as.numeric(type.convert(as.character(d$Voltage), dec = "."))
   plot(t, voltage, type="l", xlab="datetime", ylab="Voltage",ylim=c(234,246))
   source("plot3.R")
   plot3()
   Global_reactive_power=as.numeric(type.convert(as.character(d$Global_reactive_power), dec = "."))
   plot(t,Global_reactive_power, type="l",lwd="1", xlab="datetime", ylab="Global_reactive_power")
   plot4=dev.copy(png, 'plot4.png')
  
}
