
## Import the subsetted household power consumption (sub_hpc_data) Dataset that was created in plot1.R
sub_hpc_data = read.csv("./data/sub_hpc_data.csv", header=TRUE)

# Combine and Format the Date and Time columns.
sub_hpc_data$DateTime = strptime( apply( sub_hpc_data[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

# Plot DateTime vs Sub_metering_n where n =1, 2, 3.
plot(sub_hpc_data$DateTime, sub_hpc_data$Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering")

lines(sub_hpc_data$DateTime, sub_hpc_data$Sub_metering_2,  type="l", xlab ="", ylab = "Energy sub metering", col = "red")
lines(sub_hpc_data$DateTime, sub_hpc_data$Sub_metering_3,  type="l", xlab ="", ylab = "Energy sub metering", col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"), ncol=1, pt.cex=1, cex=0.8)

dev.copy(png, file = "./figure/plot3.png") # Copy plot3.png to a PNG file and save it in figure folder
dev.off() ## close the PNG device

