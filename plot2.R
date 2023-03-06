#Getting all the files
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "/Users/amani/Documents/Coursera-DS/Explor_Week1.zip")

#Unzipping all the files
unzip(zipfile = "/Users/amani/Documents/Coursera-DS/Explor_Week1.zip", exdir = "/Users/amani/Documents/Coursera-DS/Explor_Week1")

#Importing and reading the data
power<- read.table("/Users/amani/Documents/Coursera-DS/Explor_Week1/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Creating one column for date and time
dt <- paste(power$Date, power$Time, sep=" ")
datetime <- strptime(dt,  "%d/%m/%Y %H:%M:%S")

#Merging the new column with the rest of the data
power1 <- cbind(power, datetime)

#Correcting formats as required
power1$Date <- as.Date(power1$Date, format="%d/%m/%Y")
power1$Time <- format(power1$Time, format="%H:%M:%S")
power1$Global_active_power <- as.numeric(power1$Global_active_power)
power1$Global_reactive_power <- as.numeric(power1$Global_reactive_power)
power1$Voltage <- as.numeric(power1$Voltage)
power1$Global_intensity <- as.numeric(power1$Global_intensity)
power1$Sub_metering_1 <- as.numeric(power1$Sub_metering_1)
power1$Sub_metering_2 <- as.numeric(power1$Sub_metering_2)
power1$Sub_metering_3 <- as.numeric(power1$Sub_metering_3)

#Creating a subset of the data for Feb 01, 2007 and Feb 02, 2007
data <- subset(power1, Date=="2007-02-01" | Date =="2007-02-02")

##Creating plot 2 in png file for global active power and date_time
png(filename = "/Users/amani/Plots/plot2.png",width = 480, height = 480)
with(data, plot(datetime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))
dev.off()

