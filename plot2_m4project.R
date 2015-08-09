#Read file in
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
select_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plot data
GlobalActivePower <- as.numeric(select_data$Global_active_power)
x_axis <- strptime(paste(select_data$Date,select_data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(x_axis,GlobalActivePower,type="l",main="Global Active Power",xlab="Day",
     ylab="Global Active Power (kilowatts)") 
dev.off()
