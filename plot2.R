source("load_data.R")

if (!("consumption" %in% ls())) consumption <- load_data()


png("plot2.png", width = 480, height = 480)

with(consumption, plot(Date, Global_active_power, xlab = "",
                       ylab = "Global Active Power (kilowatts)",
                       type = "l"))

dev.off()
