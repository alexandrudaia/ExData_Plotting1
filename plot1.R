plot1=function()
{
  setwd("C:/Users/Home/Desktop")
  df = read.table("household.txt", header=T, sep=';')
  df$Date = as.Date(df$Date, format ="%d/%m/%Y")
  df1=df[df$Global_active_power!="?",]
  d=df1[df1$Date=="2007-02-01"|df1$Date=="2007-02-02",]
  global_active_power=as.numeric(type.convert(as.character(d$Global_active_power), dec = "."))
  hist(global_active_power,col="red",main="Global active power",xlab="Global active power(kilowatts)")
  plot1=dev.copy(png, 'plot1.png')
}
