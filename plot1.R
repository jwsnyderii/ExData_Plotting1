# source the common load data script.  Provides the load_data() function
source("load_data.R")

if (!("consumption" %in% ls())) consumption <- load_data()

png("plot1.png", width = 480, height = 480)
with(consumption, hist(Global_active_power, main = "Global Acitve Power",
                       col = "red", xlab = "Global Active Power (kilowatts)",
                       ylab = "Frequency", ylim = c(0, 1200)))
dev.off()
