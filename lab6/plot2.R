data<-read.table("/Users/alinanastasyak/Desktop/пари/Єгорченко/lab6/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
##Reads in data from file then subsets data for specified dates
data2 <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
##Filter data from 1/2/2007 and 2/2/2007
data2$DateTime<-paste(data2$Date, data2$Time)
data2$DateTime<-strptime(data2$DateTime, "%d/%m/%Y %H:%M:%S")
data2$Date<-as.Date(data2$Date, "%d/%m/%Y")
##Plot 2
png("plot2.png", width=480, height=480)
plot(data2$DateTime, data2$Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power (kilowatts)")
dev.off()
