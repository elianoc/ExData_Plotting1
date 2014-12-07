# plot2.R 
#plotted with much help from github community

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
png("Plot2.png")
plot(electric$DateTime, electric$Global_active_power,type = "l", xlab= "", ylab = "Global Active Power(kilowatts)")

#close the PDF file device
dev.off() 