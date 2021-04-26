library(lubridate)
library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile = "assignment.zip")
unzip("assignment.zip")
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

power$Date <- dmy(power$Date)
febpower <- power %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
febx <- strptime(with(febpower, paste(Date,Time)), format = "%Y-%m-%d %H:%M:%S")

dev.off()
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

## first chart
febx <- strptime(with(febpower, paste(Date,Time)), format = "%Y-%m-%d %H:%M:%S")
plot(febx, febpower$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
lines(febx, febpower$Global_active_power)
## second chart 
plot(febx, febpower$Voltage, ylab = "Voltage", xlab = "datetime", type = "n")
lines(febx, febpower$Voltage)
# third chart
plot(febx, febpower$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(febx, febpower$Sub_metering_1)
lines(febx, febpower$Sub_metering_2, col = "red")
lines(febx, febpower$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black","red","blue"), bty = "n")
## fourth chart
plot(febx, febpower$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n")
lines(febx, febpower$Global_reactive_power)

dev.off()

