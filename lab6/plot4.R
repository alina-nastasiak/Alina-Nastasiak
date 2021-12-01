data<-read.table("/Users/alinanastasyak/Desktop/пари/Єгорченко/lab6/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
##Reads in data from file then subsets data for specified dates
data2 <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
##Filter data from 1/2/2007 and 2/2/2007
data2$DateTime<-paste(data2$Date, data2$Time)
data2$DateTime<-strptime(data2$DateTime, "%d/%m/%Y %H:%M:%S")
data2$Date<-as.Date(data2$Date, "%d/%m/%Y")
##Plot 4
png("plot4.png", width=480, height=480)
plot(data2$DateTime, data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$DateTime, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), bty = "n")
plot(data2$DateTime, data2$Global_reactive_power, type = "l", xlab = "datetime",  ylab = "Global_reactive_power")
dev.off()