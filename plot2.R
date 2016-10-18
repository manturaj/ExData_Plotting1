hpc<-read.csv("~/Documents/hpc.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE,dec = ".")
#hpc$Date<-as.Date(hpc$Date,format = "%d/%m/%y")
newhpc<-hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
ntime<-strptime(paste(newhpc$Date, newhpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(newhpc$Global_active_power)
png("plot2.png", width=480, height=480)
plot(ntime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()