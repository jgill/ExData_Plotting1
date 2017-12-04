energy = read.delim("./data/feb_household_power_consumption.txt", sep=";")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")

png(filename = "plot1.png",
             width = 480, height = 480, units = "px")

hist(energy$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
