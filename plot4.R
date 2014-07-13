lines(datetimes, workData$Global_reactive_power)
data = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
workData = data[as.Date("2007-02-01") == data$Date | data$Date == as.Date("2007-02-02"),]
rm(data)
 
png("plot4.png")
 
datetime_strings = paste(workData$Date, workData$Time, sep=" ")
datetimes = as.POSIXct(datetime_strings, format="%Y-%m-%d %T")

par(mfcol=c(2,2))
 
plot(datetimes, workData$Global_active_power, pch="", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetimes, workData$Global_active_power)
 
plot(datetimes, workData$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(datetimes, workData$Sub_metering_1, col="black")
lines(datetimes, workData$Sub_metering_2, col="red")
lines(datetimes, workData$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"))

plot(datetimes, workData$Voltage, pch="", ylab="Voltage")
lines(datetimes, workData$Voltage)

plot(datetimes, workData$Global_reactive_power, pch="", ylab="Global_reactive_power")
lines(datetimes, workData$Global_reactive_power)

dev.off()