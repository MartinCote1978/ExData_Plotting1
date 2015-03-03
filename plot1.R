# Coursera - Exploratory Data Analysis - Course Project #1 - Plot 1

## Read the data in
power_consumption_data <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Prep the data (i.e. 1. switching date/time format.  2. selecting the proper concerned observations)
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
power_consumption_data <- power_consumption_data[power_consumption_data$Date == "2007-02-01" |
                                                   power_consumption_data$Date == "2007-02-02", ]

## Prepare the data (as necessary)
## N/A

## Prepare the plot (i.e. opening the device)
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

## Complete the plot
hist(power_consumption_data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     #xlim = c(0, 6),
     ylim = c(0, 1200),
     col = "red"
     )

## Close the device
dev.off()
