# Coursera - Exploratory Data Analysis - Course Project #1 - Plot 4

## Read the data in
power_consumption_data <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Prep the data (i.e. 1. switching date/time format.  2. selecting the proper concerned observations)
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
power_consumption_data <- power_consumption_data[power_consumption_data$Date == "2007-02-01" |
                                                   power_consumption_data$Date == "2007-02-02", ]

## Prepare the data (as necessary)
power_consumption_data$DateTime <- strptime(paste(power_consumption_data$Date,
                                                  " ",
                                                  power_consumption_data$Time),
                                            format="%Y-%m-%d %H:%M:%S"
                                            )

## Prepare the plot (i.e. opening the device)
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

## Complete the plot
### Set overall graphic devices to a 2x2 plotting areas (using
### column - mfcol - to add the plots in the right order).
par(mfcol=c(2, 2))

### Plot 1
with(power_consumption_data, plot(Global_active_power,
                                  type = "l",
                                  main = "",
                                  xlab = "",
                                  ylab = "Global Active Power",
                                  col = "black",
                                  xaxt = "n",
                                  yaxt = "n"
)
)
axis(1, at=c(1,
             nrow(power_consumption_data[power_consumption_data$Date == "2007-02-01", ]),
             nrow(power_consumption_data)),
     labels = c("Thu", "Fri", "Sat")
)
axis(2, at=c(0, 2, 4, 6),
     labels=c("0", "2", "4", "6")
)

### Plot 2
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


### Plot 3
with(power_consumption_data, plot(Voltage,
                                  type = "l",
                                  col = "black",
                                  main = "",
                                  xlab = "datetime",
                                  ylab = "Voltage",
                                  xaxt = "n",
                                  yaxt = "n"
                                  )
     )
axis(1, at=c(1,
             nrow(power_consumption_data[power_consumption_data$Date == "2007-02-01", ]),
             nrow(power_consumption_data)),
     labels = c("Thu", "Fri", "Sat")
)
axis(2, at=c(234, 238, 242, 246),
     tick = 4,
     labels=c("234", "238", "242", "246")
)

### Plot 4
with(power_consumption_data, plot(Global_reactive_power,
                                  type = "l",
                                  col = "black",
                                  main = "",
                                  xlab = "datetime",
                                  ylab = "Global_reactive_power",
                                  xaxt = "n",
                                  yaxt = "n"
                                  )
     )
axis(1, at=c(1,
             nrow(power_consumption_data[power_consumption_data$Date == "2007-02-01", ]),
             nrow(power_consumption_data)),
     labels = c("Thu", "Fri", "Sat")
)
axis(2, at=c(0.1, 0.2, 0.3, 0.4, 0.5),
     labels=c("0.1", "0.2", "0.3", "0.4", "0.5")
)

## Close the device
dev.off()
