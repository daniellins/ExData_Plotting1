
#loading data
data <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?")

#convert data column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset data
subset_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")
subset_data$datetime <- as.POSIXct(subset_data$datetime)

# Plotting data
attach(subset_data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(subset_data)