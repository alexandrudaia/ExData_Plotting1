plot2=function()
{
setwd("C:/Users/Home/Desktop")
df = read.table("household.txt", header=T, sep=';')
df$Date = as.Date(df$Date, format ="%d/%m/%Y")
df1=df[df$Global_active_power!="?",]
d=df1[df1$Date=="2007-02-01"|df1$Date=="2007-02-02",]
global_active_power=as.numeric(type.convert(as.character(d$Global_active_power), dec = "."))
a=paste(d$Date,d$Time)
t=as.POSIXct(strptime(a, "%Y-%m-%d %H:%M:%S"))
plot(t, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot2=dev.copy(png, 'plot2.png')
}
