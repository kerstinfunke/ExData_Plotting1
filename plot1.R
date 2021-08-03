power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")

hist(
  subset(power$Global_active_power, power$Date =="2007-02-01"| power$Date =="2007-02-02"), 
  col="red", 
  xlab = "Global Active Power (kilowatt)", 
  main = "Global Active Power")

dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()

