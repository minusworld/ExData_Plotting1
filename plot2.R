data = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
workData = data[as.Date("2007-02-01") == data$Date | data$Date == as.Date("2007-02-02"),]
rm(data)

datetime_strings = paste(workData$Date, workData$Time, sep=" ")
datetimes = as.POSIXct(datetime_strings, format="%Y-%m-%d %T")

png("plot2.png")

plot(datetimes, workData$Global_active_power, pch="", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetimes, workData$Global_active_power)

dev.off()