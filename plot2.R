fn <- "household_power_consumption.txt"

colNames = c("date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
colClasses = c("character","character",rep("numeric",7))

df <- read.table(fn,header=TRUE,sep=";",col.names=colNames,colClasses=colClasses,na.string="?")

df$date=as.Date(df$date,format="%d/%m/%Y")
df=df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]

png(filename="plot2.png",width=480,height=480,units="px")
plot(df$GlobalActivePower,type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1,as.integer(nrow(df)/2),nrow(df)),labels=c("Thu", "Fri","Sat"))


dev.off()

