source("load_data.R")

if (!("consumption" %in% ls())) consumption <- load_data()


png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
par(mar = c(4, 4, 1, 1))

# Plot 1
with(consumption, plot(Date, Global_active_power, xlab = "",
                       ylab = "Global Active Power",
                       type = "l"))

# Plot 2
with(consumption, plot(Date, Voltage,
                       type = "l"))

# Plot 3
with(consumption, plot(Date, Sub_metering_1, xlab = "",
                       ylab = "Energy sub metering",
                       type = "l"))
with(consumption, lines(Date, Sub_metering_2, col = "red"))
with(consumption, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

# Plot 4
with(consumption, plot(Date, Global_active_power,
                       type = "l"))

dev.off()
