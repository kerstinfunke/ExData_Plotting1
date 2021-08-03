power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?")

power$DateTime <- with(power, as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")) 

power$Date <- as.Date(power$Date, "%d/%m/%Y")

powerSubset <- subset(power, power$Date =="2007-02-01"| power$Date =="2007-02-02")

plot(
  powerSubset$DateTime, powerSubset$Global_active_power,  
  ylab = "Global Active Power (kilowatts)", 
  xlab = "", type="l")

dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()
