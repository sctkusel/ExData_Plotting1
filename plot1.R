library(sqldf)

## Read only the data that will be used (from the dates 2007-02-01 and 2007-02-02)
data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
closeAllConnections()

## Create the plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Copy the plot to a png file
dev.copy(png, file = "plot1.png", width=480, height=480)

## Close png device
dev.off()