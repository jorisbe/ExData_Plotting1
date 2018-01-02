library(dplyr)
library(lubridate)
## read data
#data <- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## make plot and save in plot2.png
png(filename = "plot4.png", width = 480, height = 480)

## filter dates
days <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

## convert date and time to new variable datetime
days <- mutate(days, DateTime = dmy_hms(paste(Date,Time)))

## set grid for plots
par(mfrow=c(2,2))


## plot datetime and global_active_power as lines
plot(days$DateTime,days$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(days$DateTime,days$Global_active_power)

## plot datetime and voltage as lines
plot(days$DateTime,days$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(days$DateTime,days$Voltage)

## plot datetime and Energy submetering as lines
plot(days$DateTime,days$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(days$DateTime,days$Sub_metering_1,col = "black")
lines(days$DateTime,days$Sub_metering_2, col = "red")
lines(days$DateTime,days$Sub_metering_3, col = "blue")
# Add legend in the topright corner
legend(x = "topright",col = c("black","red","blue"),lty = 1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

## plot datetime and global_reactive_power as lines
plot(days$DateTime,days$Global_reactive_power, type = "n",  ylab = "Global_reactive_power", xlab = "datetime")
lines(days$DateTime,days$Global_reactive_power)


dev.off()