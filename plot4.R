power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?")

power$datetime <- with(power, as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")) 

power$Date <- as.Date(power$Date, "%d/%m/%Y")

powerSubset <- subset(power, power$Date =="2007-02-01"| power$Date =="2007-02-02")

par(mfrow=c(2,2), cex = 0.7)

plot(
  powerSubset$datetime, powerSubset$Global_active_power,  
  ylab = "Global Active Power", 
  xlab = "", type="l")

plot(
  powerSubset$datetime, powerSubset$Voltage,  
  ylab = "Voltage", xlab = "datetime", type="l") 


plot(
  powerSubset$datetime, powerSubset$Sub_metering_1,  
  ylab = "Energy sub metering", 
  xlab = "", type="l")
lines(powerSubset$datetime, powerSubset$Sub_metering_2, col="red") 
lines(powerSubset$datetime, powerSubset$Sub_metering_3, col="blue") 
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), bty = "n")


plot(
  powerSubset$datetime, powerSubset$Global_reactive_power,  
  ylab = "Global_reactive_power", xlab = "datetime", type="l") 


dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()