# Coursera - Exploratory Data Analysis - Course Project #1 - Plot 2

## Read the data in
power_consumption_data <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Prep the data (i.e. 1. switching date/time format.  2. selecting the proper concerned observations)
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
power_consumption_data <- power_consumption_data[power_consumption_data$Date == "2007-02-01" |
                                                   power_consumption_data$Date == "2007-02-02", ]

## Prepare the data (as necessary)
### N/A

## Prepare the plot (i.e. opening the device)
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")

## Complete the plot
#with(power_consumption_data, plot(seq(from=ISOdate(2007,02,01), by="sec", along.with=Date ),
with(power_consumption_data, plot(Global_active_power,
                                  type = "l",
                                  main = "",
                                  xlab = "",
                                  ylab = "Global Active Power (kilowatts)",
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

## Close the device
dev.off()
