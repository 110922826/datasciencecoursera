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
png("plot2.png", width = 480, height = 480)
plot(e, as.numeric(as.character(d[,3])), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off
