plot1 <- function() {
    library(data.table)
    data <- fread("household_power_consumption.txt")
    data <- data[, Date := as.Date(Date, "%d/%m/%Y")]
    data <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]
    data <- data[, Global_active_power := as.numeric(Global_active_power)]
    
    png(file = "Plot1.png", width = 480, height = 480)
    hist(data$Global_active_power, main = "Global Active Power",col = "Red", xlab = "Global Active Power (kilowatts)")
    dev.off()
}