# Exploratory Data Analysis
# Course Project 1
# Plot 3

# Read data
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", 
                   stringsAsFactors=FALSE)
# Define data of interest
doi <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

# Define classes for Date and Time
dateTime <- strptime(paste(doi$Date, doi$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

# Construct plot
plot(dateTime, as.numeric(doi$Sub_metering_1), xlab="", 
     ylab="Energy sub metering", type="l")
lines(dateTime, as.numeric(doi$Sub_metering_2), col="red")
lines(dateTime, as.numeric(doi$Sub_metering_3), col="blue")
# Add legend
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2",
                            "Sub_metering_3"),
       col=c("black", "red", "blue"))

# Create PNG file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
