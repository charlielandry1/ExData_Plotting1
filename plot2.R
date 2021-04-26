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
par(mfrow = c(1,1))

png(filename = "plot2.png", width = 480, height = 480, units = "px")

febx <- strptime(with(febpower, paste(Date,Time)), format = "%Y-%m-%d %H:%M:%S")
plot(febx, febpower$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(febx, febpower$Global_active_power)

dev.off()
