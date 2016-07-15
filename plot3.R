#     Masoud S. Nosrati       #
#                             #
#  Exploratory Data Analysis  #
#     Course Project 1        #
###############################

# read the data set
#####################
power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
power_consumption <- power_consumption[power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007",]

#head(power_consumption)

# change date/time type
#####################
dates <- c(as.character(power_consumption$Date))
times <- c(as.character(power_consumption$Time))
dates_times <- paste(dates, times)
dates_times <- strptime(dates_times, "%d/%m/%Y %H:%M:%S")

# plot 3
#####################
dev.new()
par(mfrow = c(1,1), bg = "white")
plot(dates_times, power_consumption$Sub_metering_1, "solid", ylab = "Energy sub metering", xlab = "")
lines(dates_times, power_consumption$Sub_metering_2, "solid", col = "red")
lines(dates_times, power_consumption$Sub_metering_3, "solid", col = "blue")
legend("topright", lty =  c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub metering_1", "Sub metering_2", "Sub metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()