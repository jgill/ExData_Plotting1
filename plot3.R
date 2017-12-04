library(lubridate)

energy = read.delim("./data/feb_household_power_consumption.txt", sep=";")
energy$DateTime <- strptime(paste(energy$Date, energy$Time), "%d/%m/%Y %H:%M:%S")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")

png(filename = "plot3.png",
             width = 480, height = 480, units = "px")

with(energy, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(energy, lines(DateTime, Sub_metering_1))
with(energy, lines(DateTime, Sub_metering_2, col = "red"))
with(energy, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


