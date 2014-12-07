# plot4.R 

#library(data.table)

#get data
electric <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE, stringsAsFactors = FALSE)

#convert date
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")

#subset date
electric = electric[electric$Date == "2007-02-01" | electric$Date == "2007-02-02",]

#get time
electric$DateTime <- strptime(paste(electric$Date,electric$Time),format="%Y-%m-%d %H:%M:%S")

#make plot
png("Plot4.png")
par(mfrow=c(2,2))

#plot 1 upper left
plot(electric$DateTime, electric$Global_active_power, type="l", xlab="", ylab= "Global Active Power")
#plot 2 upper right
plot(electric$DateTime, electric$Voltage, type="l", xlab="datetime", ylab= "Voltage")
#plot 3 lower left
plot(electric$DateTime, electric$Sub_metering_1, type = "l", xlab= "", ylab = "Energy Sub Metering")
lines(electric$DateTime, electric$Sub_metering_2, type="l", col="red")
lines(electric$DateTime, electric$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot 4 lower right
plot(electric$DateTime, electric$Global_reactive_power, type="l", xlab="datetime", ylab= "Global_reactive-power")


#close the PDF file device
dev.off() 