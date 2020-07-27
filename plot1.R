# Exploratory Data Analysis
# Course Project 1
# Plot 1

# Read data
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", 
                   stringsAsFactors=FALSE)
# Define data of interest
doi <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

# Construct histogram
hist(as.numeric(doi$Global_active_power), col="red",
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

# Create PNG file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
