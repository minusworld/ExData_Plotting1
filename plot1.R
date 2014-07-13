data = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
workData = data[as.Date("2007-02-01") == data$Date | data$Date == as.Date("2007-02-02"),]
rm(data)
png("plot1.png")
hist(workData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()