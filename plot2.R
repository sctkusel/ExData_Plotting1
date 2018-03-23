library(sqldf)

## Read only the data that will be used (from the dates 2007-02-01 and 2007-02-02)
data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
closeAllConnections()

## Convert Date and Time variables to Date/Time classes
datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Create the plot 
plot(datetime, data$Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power (kilowatts)")

## Copy the plot to a png file
dev.copy(png, file = "plot2.png", width=480, height=480)

## Close png device
dev.off()