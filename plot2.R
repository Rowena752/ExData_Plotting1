library(lubridate)
hhpower <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hhpower$DT <- paste(hhpower$Date, hhpower$Time)
hhpower$DT <- dmy_hms(hhpower$DT)
hhpower <- hhpower[(hhpower$DT >= ymd("2007-02-01") & hhpower$DT < ymd("2007-02-03")),]
hhpower[,3:9] <- sapply(hhpower[,3:9], as.numeric)
png(file = "plot2.png", width = 480, height = 480)
with(hhpower, plot(Global_active_power~DT, type = "l", ylab = "Global active power (kilowatts)", xlab = NA))
dev.off()


