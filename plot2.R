setwd("C:/Users/pavi/Desktop/desktop/R-folder/ExploratoryDataAnalysis")

library(data.table)

file = read.table("household_power_consumption.txt", sep=";", header = TRUE)

data = file[file$Date %in% c("1/2/2007","2/2/2007") ,]

Globalactivepower = as.numeric(data$Global_active_power)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


plot(datetime, Globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

