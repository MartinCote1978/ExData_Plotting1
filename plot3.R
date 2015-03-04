# Coursera - Exploratory Data Analysis - Course Project #1 - Plot 3

## Read the data in
power_consumption_data <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Prep the data (i.e. 1. switching date/time format.  2. selecting the proper concerned observations)
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
power_consumption_data <- power_consumption_data[power_consumption_data$Date == "2007-02-01" |
                                                   power_consumption_data$Date == "2007-02-02", ]

## Prepare the plot (i.e. opening the device)
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

## Complete the plot
with(power_consumption_data, plot(Sub_metering_1,
                                  type = "l",
                                  col = "black",
                                  main = "",
                                  xlab = "",
                                  ylab = "Energy sub metering",
                                  xaxt = "n",
                                  yaxt = "n"
                                  )
     )
lines(power_consumption_data$Sub_metering_2, type="l", col="red")
lines(power_consumption_data$Sub_metering_3, type="l", col="blue")
axis(1, at=c(1,
             nrow(power_consumption_data[power_consumption_data$Date == "2007-02-01", ]),
             nrow(power_consumption_data)),
     labels = c("Thu", "Fri", "Sat")
     )
axis(2, at=c(0, 10, 20, 30),
     labels=c("0", "10", "20", "30")
     )
legend("topright",
       lty=1,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close the device
dev.off()
