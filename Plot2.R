# Read in the data set and subset to include only readings from 01/02/2007 and 02/02/2007
# Convert the Date variable to a date field and the Global_active_power variable to a numeric
# Add an additional field DateTime to merge the Date and Time fields to create a Date Time variable
library(data.table)

Data <- fread("./household_power_consumption.txt")
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
PlotData <- subset(Data, Data$Date > "2007-01-31" & Data$Date < "2007-02-03")
PlotData$Global_active_power <- as.numeric(PlotData$Global_active_power)
PlotData$DateTime <-as.POSIXct(paste(as.Date(PlotData$Date), PlotData$Time, sep=" "))

# Create plot 2

# Open a png file with a width and height of 480 pixels and save it was 'Plot2'
png(filename= "plot2.png", width= 480, height = 480)

# Create the line graph

plot(PlotData$DateTime, PlotData$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")

# Close the png file
dev.off()

