initial <- read.table("household_power_consumption.txt", header=TRUE, 
                      sep = ";", nrows= 100)
classes <- sapply(initial, class)
entire <- read.table("household_power_consumption.txt", header=TRUE, 
                     sep= ";", na.strings="?", colClasses = classes)
entire[,1] <- as.Date(entire[,1], format = "%d/%m/%Y")
sub1 <- filter(entire, Date == "2007-02-01" | Date == "2007-02-02")
dayplustime <- paste(sub1$Date,sub1$Time)
almost_day_with_time <- strftime(dayplustime)
fixed_time <- strptime(almost_day_with_time, format = "%Y-%m-%d %H:%M:%S",tz="")
par(mfcol= c(2,2))
firstplot <- plot(fixed_time, sub1[,3], sub= NULL, xlab= " ", ylab = "Global Active Power (kilowatts)", type = "l")
secondplot <- plot(fixed_time, sub1[,7], sub= NULL, xlab= " ", ylab = "Energy sub metering", type = "l")
lines(fixed_time, sub1[,8], col = "red")
lines(fixed_time, sub1[,9], col = "blue")
legend("topright",pch= NA, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty= "n", inset= .3, cex = .6)

thirdplot <- thirdplot <- plot(fixed_time, sub1[,5], sub= NULL, xlab= "datetime ", ylab = "Voltage", type = "l")

fourthplot <- plot(fixed_time, sub1[,4], sub= NULL, xlab= "datetime ", ylab = "Global_reactive_power", type = "l")