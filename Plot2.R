plot2 <- function() {
    library(data.table)
    data <- fread("household_power_consumption.txt")
    data <- data[, Date := as.Date(Date, "%d/%m/%Y")]
    data <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]
    data2 <- as.data.frame(data)
    dateTime <- paste(data2$Date, data2$Time, sep = " ")
    dateTime <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")
    data2$DateTime <- dateTime
    data <- data[, Global_active_power := as.numeric(Global_active_power)]
    
    png(file = "Plot2.png", width = 480, height = 480)
    plot(data2$DateTime, data2$Global_active_power, type ="l", xlab = "DateTime", ylab = "Global Active Power (kilowatts)")
    dev.off()
}