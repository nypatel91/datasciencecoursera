#Read file in
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
select_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plot data
SM1<- as.numeric(select_data$Sub_metering_1)
SM2<- as.numeric(select_data$Sub_metering_2)
SM3<- as.numeric(select_data$Sub_metering_3)
x_axis <- strptime(paste(select_data$Date,select_data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(x_axis,SM1,type="l",xlab="Day",ylab="Energy Sub Metering") 
lines(x_axis,SM2,col="red")
lines(x_axis,SM3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,lwd=1.5)
dev.off()
