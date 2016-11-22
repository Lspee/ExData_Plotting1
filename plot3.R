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
thirdplot <- plot(fixed_time, sub1[,7], sub= NULL, xlab= " ", ylab = "Energy sub metering", type = "l", cex = 0.6)
lines(fixed_time, sub1[,8], col = "red")
lines(fixed_time, sub1[,9], col = "blue")
legend("topright",pch= NA, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty= "n", inset= .2)