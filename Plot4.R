# Read in the data set and subset to include only readings from 01/02/2007 and 02/02/2007
# Convert the Date variable to a date field and the Global_active_power variable to a numeric
# Add an additional field DateTime to merge the Date and Time fields to create a Date Time variable
library(data.table)

Data <- fread("./household_power_consumption.txt")
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
PlotData <- subset(Data, Data$Date > "2007-01-31" & Data$Date < "2007-02-03")
PlotData$Global_active_power <- as.numeric(PlotData$Global_active_power)
PlotData$DateTime <-as.POSIXct(paste(as.Date(PlotData$Date), PlotData$Time, sep=" "))
PlotData$Sub_metering_1 <- as.numeric(PlotData$Sub_metering_1)
PlotData$Sub_metering_2 <- as.numeric(PlotData$Sub_metering_2)
PlotData$Sub_metering_3 <- as.numeric(PlotData$Sub_metering_3)
PlotData$Voltage <- as.numeric(PlotData$Voltage)
PlotData$Global_reactive_power <- as.numeric(PlotData$Global_reactive_power)

# Create plot 4

# Open a png file with a width and height of 480 pixels and save it was 'Plot4'
png(filename= "plot4.png", width= 480, height = 480)

# Create the line graph

par(mfrow  = c(2,2))
with(PlotData, {plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
    plot(PlotData$DateTime, PlotData$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(DateTime, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
      points(DateTime, Sub_metering_2, type="l", col="red")
      points(DateTime, Sub_metering_3, type="l", col="blue")
      legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,lwd=1, bty="n", col=c("black", "red", "blue"))
      plot(DateTime, Global_reactive_power, type="l", xlab = "datatime", ylab = "Global_reactive_power")
})

# Close the png file
dev.off()
