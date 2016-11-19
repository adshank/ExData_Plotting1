# This R script creates Plot 4 for the 1st course project for Coursera course "Exploratory Data Analysis"
# The script starts by importing the data (given as a text file from Coursera)
# Next, the script cleans the data and selects a subset of the data for analysis
# Finally, the script creates the plot (histogram). 
# The graph that is outputted by the script can be found in the file "Plot 4.PNG"

# Set directory path
dir_path = "C:/Users/adshan/Documents/Coursera/John Hopkins Data Science Specialization/Exploratory Data Analysis/"
setwd(dir_path)

# Read in txt file for processing
originalData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Change date and time formats
originalData$Global_active_power <- as.numeric(originalData$Global_active_power)
originalData$Date <- as.Date(originalData$Date, format = "%d/%m/%Y")
originalData$Time <- strptime(paste(originalData$Date, originalData$Time), format = "%Y-%m-%d %H:%M:%S")

# Select only days needed for assignment
day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")
dataForUse <- originalData[originalData$Date %in% c(day1, day2), ]


# Initialize png
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Set plot screen to accept three different plots
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# Create 1st plot
plot(dataForUse$Time, dataForUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Create 2nd plot
plot(dataForUse$Time, dataForUse$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Create 3rd plot
plot(dataForUse$Time, dataForUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dataForUse$Time, dataForUse$Sub_metering_2, type = "l", col = "red")
lines(dataForUse$Time, dataForUse$Sub_metering_3, type = "l", col = "blue")

legend_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")
legend("topright", legend = legend_names, border = "black", col = legend_colors, lty = 1, cex = 0.7)

# Create 4th plot
plot(dataForUse$Time, dataForUse$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
