# read the data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                   colClasses = c('character','character','numeric','numeric','numeric',
                                  'numeric','numeric','numeric','numeric'), header = TRUE)
# subsetting the data from 2007-02-01 and 2007-02-02
chosen_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# converting the datetime
newDateTime <- strptime(paste(chosen_data$Date,chosen_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# making the plot
png("plot2.png", width = 480, height = 480)
plot(newDateTime, chosen_data$Global_active_power, ylab = "Global Active Power (kilowatts)", 
     col="black", type = "l", xlab = "")
dev.off()