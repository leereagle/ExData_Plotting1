fn <- "household_power_consumption.txt"

colNames = c("date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
colClasses = c("character","character",rep("numeric",7))

df <- read.table(fn,header=TRUE,sep=";",col.names=colNames,colClasses=colClasses,na.string="?")

df$date=as.Date(df$date,format="%d/%m/%Y")
df=df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]

png(filename="plot1.png",width=480,height=480,units="px")
hist(df$GlobalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()

