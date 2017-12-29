## read data
data <- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
## select only february first and second of 2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
## make histogram and save in plot1.png
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()