# plot1.R 

#library(data.table)

#get data
electric <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE, stringsAsFactors = FALSE)

#convert date
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")

#subset date
electric = electric[electric$Date == "2007-02-01" | electric$Date == "2007-02-02",]

#make plot
png("Plot1.png")
hist(electric$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power(kilowatts)", breaks = 15)

#close the PDF file device
dev.off() 
