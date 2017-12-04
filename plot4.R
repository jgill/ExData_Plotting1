library(lubridate)

energy = read.delim("./data/feb_household_power_consumption.txt", sep=";")
energy$DateTime <- strptime(paste(energy$Date, energy$Time), "%d/%m/%Y %H:%M:%S")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")

png(filename = "plot4.png",
             width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))

with(energy, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

with(energy, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

with(energy, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(energy, lines(DateTime, Sub_metering_1))
with(energy, lines(DateTime, Sub_metering_2, col = "red"))
with(energy, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(energy, plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()



