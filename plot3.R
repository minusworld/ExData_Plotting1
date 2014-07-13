data = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
workData = data[as.Date("2007-02-01") == data$Date | data$Date == as.Date("2007-02-02"),]
rm(data)

datetime_strings = paste(workData$Date, workData$Time, sep=" ")
datetimes = as.POSIXct(datetime_strings, format="%Y-%m-%d %T")

png("plot3.png")

plot(datetimes, workData$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(datetimes, workData$Sub_metering_1, col="black")
lines(datetimes, workData$Sub_metering_2, col="red")
lines(datetimes, workData$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"))

dev.off()