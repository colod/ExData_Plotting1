#Data comes from http://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

initial<-table<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=5)
classes<-sapply(initial, class)
cols<-names(initial)
table<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", comment.char="",
                   colClasses=classes, col.names=cols, nrows=2880, skip=66636)
table$Date<-as.Date(table$Date,"%d/%m/%Y")
table$Time<-strptime(paste0(table$Date, table$Time), "%F%T")

png("plot4.png")
par(mfrow=c(2,2))
plot(table$Time, table$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(table$Time, table$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(table$Time, table$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(table$Time, table$Sub_metering_2, col="red")
lines(table$Time, table$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),
       lwd=c(1,1,1), col=c("black","red","blue"))
plot(table$Time, table$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()