# Exploratory Data Analysis
# Course Project 1
# Plot 4

# Read data
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", 
                   stringsAsFactors=FALSE)
# Define data of interest
doi <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

# Define classes for Date and Time
dateTime <- strptime(paste(doi$Date, doi$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

# Create a matrix to allow multiple plot display
par(mfrow=c(2,2), mar=c(7,4,2,2))


# Construct plot
# dateTime ~ Global_active_power
plot(dateTime, as.numeric(doi$Global_active_power), 
     xlab="", ylab="Global Active Power", type="l")

# dateTime ~ Voltage
plot(dateTime, as.numeric(doi$Voltage), 
     xlab="datetime", ylab="Voltage", type="l")

# dateTime ~ Energy sub metering
plot(dateTime, as.numeric(doi$Sub_metering_1), xlab="", 
     ylab="Energy sub metering", type="l")
lines(dateTime, as.numeric(doi$Sub_metering_2), col="red")
lines(dateTime, as.numeric(doi$Sub_metering_3), col="blue")
legend("topright", inset=0, lty=1, legend=c("Sub_metering_1", "Sub_metering_2",
                                   "Sub_metering_3"),
       col=c("black", "red", "blue"), bty="n", cex=0.8, y.intersp=0.5)

# dateTime ~ Global_reactive_power
plot(dateTime, as.numeric(doi$Global_reactive_power), 
     xlab="datetime", ylab="Global_reactive_power", type="l")


# Create PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
