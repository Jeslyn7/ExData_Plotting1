setwd("C:/Users/jesly/Desktop/exdata_data_household_power_consumption (1)")
FullData <- "household_power_consumption.txt"
data <- read.table(FullData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data <- data[which(data$Date == '2/2/2007' | data$Date=='1/2/2007'),]

data$POSIX <-as.POSIXlt.character(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")


png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(x=data$POSIX ,y=data$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power')
plot(x=data$POSIX ,y=data$Voltage, type = 'l', xlab='datetime',ylab = 'Voltage')
plot(x=data$POSIX,y=data$Sub_metering_1, type='l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(x=data$POSIX,y=data$Sub_metering_2, col='red')
lines(x=data$POSIX,y=data$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1, bty = "n")
plot(x=data$POSIX ,y=data$Global_reactive_power, type = 'l', xlab='datetime',ylab = 'Global_reactive_power')
dev.off()