library(sqldf)

## Read only the data that will be used (from the dates 2007-02-01 and 2007-02-02)
data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
closeAllConnections()

## Convert Date and Time variables to Date/Time classes
datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Open png device
png("plot4.png", width=480, height=480)

## Change par() to show 2 lines with 2 columns
par(mfrow = c(2,2))

## Create plot1 
plot(datetime, data$Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power")

## Create plot2
plot(datetime, data$Voltage, type = "l", ylab = "Voltage")

## Create plot3 
plot(datetime, data$Sub_metering_1, type = "l", xlab = "",  ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create plot4
plot(datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power")


## Close png device
dev.off()