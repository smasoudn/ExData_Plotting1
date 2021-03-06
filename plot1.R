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
#dates_times <- strptime(dates_times, "%d/%m/%Y %H:%M:%S")

# plot 1
#####################
dev.new()
par(mfrow = c(1,1), bg = "white")
hist(power_consumption$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
