library(lubridate)
library(dplyr)

load_data <- function() {
    fileURL  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipName  <- "ElectricPowerConsumption.zip"
    dataName <- "household_power_consumption.txt"
    
    if (!file.exists(dataName)){
        if (!file.exists(zipName)) download.file(fileURL, zipName)
        unzip(zipName)
    }
    
    df <- read.delim("household_power_consumption.txt", sep = ";", 
                     na.strings = "?", stringsAsFactors = FALSE)
    
    df$Date <- dmy(df$Date)
    
    df <- filter(df, Date >= dmy(01022007) & Date <= dmy(02022007))
    df$Time <- hms(df$Time)
    df$Date <- with(df, Date + Time)
    df <- select(df, -Time)
    
    return(df)
}
    