library(lubridate)

energy = read.delim("./data/feb_household_power_consumption.txt", sep=";")
energy$DateTime <- strptime(paste(energy$Date, energy$Time), "%d/%m/%Y %H:%M:%S")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")

png(filename = "plot2.png",
             width = 480, height = 480, units = "px")

plot(energy$DateTime, energy$Global_active_power,
     type= "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()

