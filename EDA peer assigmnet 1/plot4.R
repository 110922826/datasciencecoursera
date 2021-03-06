#read the raw data
b<-read.table('household_power_consumption.txt',sep=";",na.strings = "?")
#extract data
c<- grep("^[12]/2/2007", b[,1])
d<-b[c,]
#set time
d[,1] <- as.Date(d[,1] , "%d/%m/%Y")
d[,2] <- paste(d[,1], d[,2], sep=" ")
e<- strptime(d[,2], "%Y-%m-%d %H:%M:%S")
#plot and save
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(d, {
  plot(e, as.numeric(as.character(d[,3])), type = "l", xlab = "", ylab = "Global Active Power")
  
  plot(e, as.numeric(as.character(d[,5])), xlab = "datetime", type = "l", ylab = "Voltage")
  
  plot(e, as.numeric(as.character(d[,7])), xlab = "", ylab = "Energy sub metering", type = "l", ylim = range(as.numeric(as.character(d[,7]))), col = "black")
  par(new = TRUE)
  plot(e, as.numeric(as.character(d[,8])), xlab = "", axes = FALSE,ylab = "", type = "l", ylim = range(as.numeric(as.character(d[,7]))), col = "red")
  par(new = TRUE)
  plot(e, as.numeric(as.character(d[,9])), xlab = "", axes = FALSE, ylab = "", type = "l", ylim = range(as.numeric(as.character(d[,7]))), col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty = "n",
         lty = c(1,1,1),
         col = c("black", "red", "blue")
  )
  
  plot(e, as.numeric(as.character(d[,4])), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
})
dev.off
