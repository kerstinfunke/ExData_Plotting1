power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?")

power$DateTime <- with(power, as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")) 

power$Date <- as.Date(power$Date, "%d/%m/%Y")

powerSubset <- subset(power, power$Date =="2007-02-01"| power$Date =="2007-02-02")

plot(
  powerSubset$DateTime, powerSubset$Sub_metering_1,  
  ylab = "Energy sub metering", 
  xlab = "", type="l")
lines(powerSubset$DateTime, powerSubset$Sub_metering_2, col="red") 
lines(powerSubset$DateTime, powerSubset$Sub_metering_3, col="blue") 
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1))


dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()
