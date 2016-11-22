initial <- read.table("household_power_consumption.txt", header=TRUE, 
                      sep = ";", nrows= 100)
classes <- sapply(initial, class)
entire <- read.table("household_power_consumption.txt", header=TRUE, 
                     sep= ";", na.strings="?", colClasses = classes)
entire[,1] <- as.Date(entire[,1], format = "%d/%m/%Y")
sub1 <- filter(entire, Date == "2007-02-01" | Date == "2007-02-02")
firstplot <- hist(sub1[,3], main = "Global Active Power", xlab= 
 "Global Active Power (kilowatts)", col = "red")plot1 <- hist(sub1[,3])