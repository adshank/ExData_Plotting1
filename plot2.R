# This R script creates Plot 2 for the 1st course project for Coursera course "Exploratory Data Analysis"
# The script starts by importing the data (given as a text file from Coursera)
# Next, the script cleans the data and selects a subset of the data for analysis
# Finally, the script creates the plot (histogram). 
# The graph that is outputted by the script can be found in the file "Plot 2.PNG"

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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Create plot
plot(dataForUse$Time, dataForUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
