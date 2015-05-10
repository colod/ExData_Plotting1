#Data comes from http://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

initial<-table<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=5)
classes<-sapply(initial, class)
cols<-names(initial)
table<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", comment.char="",
                   colClasses=classes, col.names=cols, nrows=2880, skip=66636)
table$Date<-as.Date(table$Date,"%d/%m/%Y")
table$Time<-strptime(paste0(table$Date, table$Time), "%F%T")

png("plot3.png")
plot(table$Time, table$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(table$Time, table$Sub_metering_1)
lines(table$Time, table$Sub_metering_2, col="red")
lines(table$Time, table$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),
       lwd=c(1,1,1), col=c("black","red","blue"))
dev.off()