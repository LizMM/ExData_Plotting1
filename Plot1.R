# Read in the data set and subset to include only readings from 01/02/2007 and 02/02/2007
# Convert the Date variable to a date field and the Global_active_power variable to a numeric

library(data.table)

Data <- fread("./household_power_consumption.txt")
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
PlotData <- subset(Data, Data$Date > "2007-01-31" & Data$Date < "2007-02-03")
PlotData$Global_active_power <- as.numeric(PlotData$Global_active_power)


# Open a png file with a width and height of 480 pixels and save it was 'Plot1'
png(filename= "plot1.png", width= 480, height = 480)

# Create the histogram 'Plot1'

hist(PlotData$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main= "Global Active Power")

# Close the png file
dev.off()

