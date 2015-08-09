#Read file in
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
select_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Setting up data
GlobalActivePower <- as.numeric(select_data$Global_active_power)
x_axis <- strptime(paste(select_data$Date,select_data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

SM1<- as.numeric(select_data$Sub_metering_1)
SM2<- as.numeric(select_data$Sub_metering_2)
SM3<- as.numeric(select_data$Sub_metering_3)

voltage <- as.numeric(select_data$Voltage)

r_pwr <- as.numeric(select_data$Global_reactive_power)

#Plot the data
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(x_axis,GlobalActivePower,type="l",ylab="Global Active Power (kilowatts)",xlab="") 

plot(x_axis,voltage,type="l",ylab="Voltage",xlab="") 

plot(x_axis,SM1,type="l",ylab="Energy Sub Metering",xlab="") 
lines(x_axis,SM2,col="red")
lines(x_axis,SM3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,lwd=1.5)

plot(x_axis,r_pwr,type="l",ylab="Global_reactive_power",xlab="")

dev.off()
