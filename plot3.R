fn <- "household_power_consumption.txt"

colNames = c("date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
colClasses = c("character","character",rep("numeric",7))

df <- read.table(fn,header=TRUE,sep=";",col.names=colNames,colClasses=colClasses,na.string="?")

df$date=as.Date(df$date,format="%d/%m/%Y")
df=df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]

png(filename="plot3.png",width=480,height=480,units="px")
with(df,{
    plot(SubMetering1,type="l",xaxt="n",xlab="",ylab="Energy Sub Metering")
    lines(x=SubMetering2,col="red")
    lines(x=SubMetering3,col="blue")
    
})


axis(1,at=c(1,as.integer(nrow(df)/2),nrow(df)),labels=c("Thu", "Fri","Sat"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

