library(lubridate)
library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile = "assignment.zip")
unzip("assignment.zip")
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

power$Date <- dmy(power$Date)
febpower <- power %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

dev.off()
par(mfrow = c(1,1))

png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(febpower, hist(Global_active_power, col = "red", 
                    main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
