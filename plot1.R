getwd()
setwd("./ExData_Plotting1")
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
x <- rawData[((as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-01") | (as.Date(rawData$Date, "%d/%m/%Y") == "2007-02-02")), ]


windows()
hist(as.numeric(x$Global_active_power), 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
