library(dplyr)
library(lubridate)

file = "household_power_consumption.txt"
data <- data.table::fread(file, sep = ";", na.strings = "?", stringsAsFactors = F, header = T)
data <- tibble::as_tibble(data[data$Date %in% c("1/2/2007", "2/2/2007")])
data <- mutate(data, Date = dmy(Date), Time = hms::as_hms(Time))

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()