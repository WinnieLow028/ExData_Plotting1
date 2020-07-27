# Exploratory Data Analysis
# Course Project 1
# Plot 2

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
plot(dateTime, as.numeric(doi$Global_active_power), 
     xlab="", ylab="Global Active Power (kilowatts)",
     main="Global Active Power Vs Time", type="l")

# Create PNG file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
