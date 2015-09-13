getwd()
setwd("./ExData_Plotting1")
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
x <- rawData[((as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-02")), ]
t <- paste(x$Date, x$Time)
t <- strptime(t, "%d/%m/%Y %H:%M:%S")

windows()
plot(t, as.numeric(x$Global_active_power), 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
