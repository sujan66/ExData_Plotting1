library(dplyr)
library(lubridate)

file = "household_power_consumption.txt"
data <- data.table::fread(file, sep = ";", na.strings = "?", stringsAsFactors = F, header = T)
data <- tibble::as_tibble(data[data$Date %in% c("1/2/2007", "2/2/2007")])
datetime <- dmy_hms(paste(data$Date, data$Time, sep = " "))

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), cex = 0.8)

plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1,
       col = c("black", "red", "blue"), bty = "n")

plot(datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global Reactive Power")

dev.off()