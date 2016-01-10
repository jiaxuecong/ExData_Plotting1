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

# plot1
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(data_plot$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()