getwd()
setwd("./ExData_Plotting1")
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
x <- rawData[((as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-02")), ]
t <- paste(x$Date, x$Time)
t <- strptime(t, "%d/%m/%Y %H:%M:%S")

windows()
par(mfrow = c(2, 2))
#Plot (4-1)
plot(t, as.numeric(x$Global_active_power), 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
#################################################
#Plot (4-2)
plot(t, as.numeric(x$Voltage), 
     type = "l",
     xlab = "datatime",
     ylab = "Voltage")
#################################################
#Plot (4-3)
#Plot Sub_metering_1
plot(t, as.numeric(x$Sub_metering_1),
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
#Plot Sub_metering_2
points(t, as.numeric(x$Sub_metering_2),
       type = "l",
       col = "red")
#Plot Sub_metering_3
points(t, as.numeric(x$Sub_metering_3),
       type = "l",
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
###################################################
#Plot (4-4)
plot(t, as.numeric(x$Global_reactive_power), 
     type = "l",
     xlab = "datatime",
     ylab = "Global_reactive_power"
     )

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
