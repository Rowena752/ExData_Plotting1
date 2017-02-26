library(lubridate)
hhpower <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hhpower$DT <- paste(hhpower$Date, hhpower$Time)
hhpower$DT <- dmy_hms(hhpower$DT)
hhpower <- hhpower[(hhpower$DT >= ymd("2007-02-01") & hhpower$DT < ymd("2007-02-03")),]
hhpower[,3:9] <- sapply(hhpower[,3:9], as.numeric)
png(file = "plot3.png", width = 480, height = 480)
with(hhpower, plot(Sub_metering_1 ~ DT, type = "n", ylab = "Energy sub metering", xlab = NA))
lines(hhpower$DT, hhpower$Sub_metering_1, col = "black")
lines(hhpower$DT, hhpower$Sub_metering_2, col = "red")
lines(hhpower$DT, hhpower$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()