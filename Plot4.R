plot4 <- function() {
    library(data.table)
    data <- fread("household_power_consumption.txt")
    data <- data[, Date := as.Date(Date, "%d/%m/%Y")]
    data <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]
    data2 <- as.data.frame(data)
    dateTime <- paste(data2$Date, data2$Time, sep = " ")
    dateTime <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")
    data2$DateTime <- dateTime
    data <- data[, Global_active_power := as.numeric(Global_active_power)]
    data <- data[, Sub_metering_1 := as.numeric(Sub_metering_1)]
    data <- data[, Sub_metering_2 := as.numeric(Sub_metering_2)]
    data <- data[, Sub_metering_3 := as.numeric(Sub_metering_3)]
    data <- data[, Global_reactive_power := as.numeric(Global_reactive_power)]
    data <- data[, Voltage := as.numeric(Voltage)]

    
    png(file = "Plot4.png", width = 480, height = 480)
    
    par(mfrow = c(2, 2))
    
    plot(data2$DateTime, data2$Global_active_power, type ="l", xlab = "DateTime", ylab = "Global Active Power (kilowatts)")
    
    plot(data2$DateTime, data2$Voltage, type = "l", xlab = "DateTime", ylab = "Voltage")
    
    with(data2, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy Sub Metering"))
    with(data2, lines(DateTime, Sub_metering_1))
    with(data2, lines(DateTime, Sub_metering_2, col = "red"))
    with(data2, lines(DateTime, Sub_metering_3, col = "blue"))
    legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(data2$DateTime, data2$Global_reactive_power, type = "l", xlab = "DateTime", ylab = "Global Reactive Power")
    
    par(mfrow = c(1, 1))
    
    dev.off()    

}