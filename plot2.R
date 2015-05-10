#Data comes from http://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

initial<-table<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=5)
classes<-sapply(initial, class)
cols<-names(initial)
table<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", comment.char="",
                   colClasses=classes, col.names=cols, nrows=2880, skip=66636)
table$Date<-as.Date(table$Date,"%d/%m/%Y")
table$Time<-strptime(paste0(table$Date, table$Time), "%F%T")

png("plot2.png")
plot(table$Time, table$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()