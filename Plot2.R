
#loading data
data <- read.table("data/household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?")

#convert data column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset data
subset_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert dates and times
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")
subset_data$datetime <- as.POSIXct(subset_data$datetime)

# Plotting data
attach(subset_data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(subset_data)