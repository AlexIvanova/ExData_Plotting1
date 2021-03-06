# read the data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                   colClasses = c('character','character','numeric','numeric','numeric',
                                  'numeric','numeric','numeric','numeric'), header = TRUE)
# subsetting the data from 2007-02-01 and 2007-02-02
chosen_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# converting the datetime
newDateTime <- strptime(paste(chosen_data$Date,chosen_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# making the plots
png("plot4.png", width = 480, height =480)
par(mfrow = c(2, 2))
plot(newDateTime, chosen_data$Global_active_power, ylab = "Global Active Power", 
     col="black", type = "l", xlab = "")
plot(newDateTime, chosen_data$Voltage, ylab = "Voltage", 
     ol="black", type = "l", xlab = "datetime")
plot(newDateTime, chosen_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
     type = "l")
lines(newDateTime, chosen_data$Sub_metering_2, type = "l", col = "red")
lines(newDateTime, chosen_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
plot(newDateTime, chosen_data$Global_reactive_power, ylab = "Global_reactive_power", 
     col="black", type = "l", xlab = "datetime")
dev.off()