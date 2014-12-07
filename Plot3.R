# plot3.R 


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
png("Plot3.png")
plot(electric$DateTime, electric$Sub_metering_1, type = "l", xlab= "", ylab = "Energy Sub Metering")
lines(electric$DateTime, electric$Sub_metering_2, col="red")
lines(electric$DateTime, electric$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close the PDF file device
dev.off() 