source("load_data.R")

if (!("consumption" %in% ls())) consumption <- load_data()


png("plot3.png", width = 480, height = 480)

with(consumption, plot(Date, Sub_metering_1, xlab = "",
                       ylab = "Energy sub metering",
                       type = "l"))
with(consumption, lines(Date, Sub_metering_2, col = "red"))
with(consumption, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()
