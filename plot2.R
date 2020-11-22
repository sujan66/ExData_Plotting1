library(dplyr)
library(lubridate)

file = "household_power_consumption.txt"
data <- data.table::fread(file, sep = ";", na.strings = "?", stringsAsFactors = F, header = T)
data <- tibble::as_tibble(data[data$Date %in% c("1/2/2007", "2/2/2007")])
datetime <- dmy_hms(paste(data$Date, data$Time, sep = " "))

png("plot2.png", width = 480, height = 480)
plot(datetime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()