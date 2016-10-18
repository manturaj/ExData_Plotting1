hpc<-read.csv("~/Documents/hpc.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE,dec = ".")
#hpc$Date<-as.Date(hpc$Date,format = "%d/%m/%y")
newhpc<-hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
ntime<-strptime(paste(newhpc$Date, newhpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(newhpc$Global_active_power)
subMetering1 <- as.numeric(newhpc$Sub_metering_1)
subMetering2 <- as.numeric(newhpc$Sub_metering_2)
subMetering3 <- as.numeric(newhpc$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(ntime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(ntime, subMetering2, type="l", col="red")
lines(ntime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()