getwd()
setwd("./ExData_Plotting1")
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
x <- rawData[((as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-02")), ]
t <- paste(x$Date, x$Time)
t <- strptime(t, "%d/%m/%Y %H:%M:%S")

windows()
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


dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
