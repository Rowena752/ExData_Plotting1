library(lubridate)
hhpower <- read.table("./household_power_consumption.txt", header = TRUE, 
                    sep = ";", stringsAsFactors = FALSE)
hhpower$DT <- paste(hhpower$Date, hhpower$Time)
hhpower$DT <- dmy_hms(hhpower$DT)
hhpower <- hhpower[(hhpower$DT >= ymd("2007-02-01") 
                & hhpower$DT < ymd("2007-02-03")),]
hhpower[,3:9] <- sapply(hhpower[,3:9], as.numeric)

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
par(mar = c(2.5, 4.5, 2, 1))
with(hhpower, plot(Global_active_power ~ DT, type = "l",
                 ylab = "Global active power (kilowatts)", xlab = NA))

with(hhpower, plot(Voltage ~ DT, type = "l",
                 ylab = "Voltage", xlab = NA))

with(hhpower, plot(Sub_metering_1 ~ DT, type = "n",
                 ylab = "Energy sub metering", xlab = NA))
lines(hhpower$DT, hhpower$Sub_metering_1, col = "black")
lines(hhpower$DT, hhpower$Sub_metering_2, col = "red")
lines(hhpower$DT, hhpower$Sub_metering_3, col = "blue")
legend("topright", bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))

with(hhpower, plot(Global_reactive_power ~ DT, type = "l",
                 ylab = "Global reactive power (kilowatts)", xlab = NA))
dev.off()