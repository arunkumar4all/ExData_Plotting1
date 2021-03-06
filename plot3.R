setwd("C:/Users/pavi/Desktop/desktop/R-folder/ExploratoryDataAnalysis")

library(data.table)

file = read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=F)

data = file[file$Date %in% c("1/2/2007","2/2/2007") ,]

Globalactivepower = as.numeric(data$Global_active_power)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)


plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")

lines(datetime, subMetering2, type="l", col = "red" )

lines(datetime, subMetering3, type="l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2 , col=c("black", "red", "blue"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
