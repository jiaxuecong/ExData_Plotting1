## setwd("/Users/jiaxuecong/Documents/Coursera/ExploratoryDataAnalysis/week1")

## Download data and read it into R
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",method="curl",temp)
data <- read.table(unz(temp,'household_power_consumption.txt'), header=T, sep=";", stringsAsFactors =F, na.strings="?",
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
unlink(temp)

## Change to date and time format
data$DT <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
data_plot <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# plot4
png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data_plot$DT, data_plot$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data_plot$DT, data_plot$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_plot$DT, data_plot$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data_plot$DT, data_plot$Sub_metering_2, type="l", col="red")
lines(data_plot$DT, data_plot$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c('black', 'red', 'blue'), bty = "n")
plot(data_plot$DT, data_plot$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()