library(dplyr)
library(lubridate)
## read data
#data <- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## make plot and save in plot2.png
png(filename = "plot2.png", width = 480, height = 480)

## filter dates
days <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

## convert date and time to new variable datetime
days <- mutate(days, DateTime = dmy_hms(paste(Date,Time)))

## plot datetime and global_active_power as lines
plot(days$DateTime,days$Global_active_power, type = "n", col="red", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(days$DateTime,days$Global_active_power)


dev.off()