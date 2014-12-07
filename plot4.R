
## Import the subsetted household power consumption (sub_hpc_data) Dataset that was created in plot1.R
sub_hpc_data = read.csv("./data/sub_hpc_data.csv", header=TRUE)

# Combine and Format the Date and Time columns.
sub_hpc_data$DateTime = strptime( apply( sub_hpc_data[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

## Plot the requried  4 graphs as follows:

par(mfrow=c(2,2)) # divide the space into 2 rows by 2 columns to plot the 4 graphs.

# plot DateTime vs Global_active_power
plot(sub_hpc_data$DateTime, sub_hpc_data$Global_active_power, type="l", xlab ="", ylab = "Global Active Power")

# plot DateTime vs Voltage
plot(sub_hpc_data$DateTime, sub_hpc_data$Voltage, type="l", xlab ="datetime", ylab = "Voltage")

# Plot DateTime vs Sub_metering_n where n =1, 2, 3.
plot(sub_hpc_data$DateTime, sub_hpc_data$Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering")
lines(sub_hpc_data$DateTime, sub_hpc_data$Sub_metering_2,  type="l", xlab ="", ylab = "Energy sub metering", col = "red")
lines(sub_hpc_data$DateTime, sub_hpc_data$Sub_metering_3,  type="l", xlab ="", ylab = "Energy sub metering", col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"), ncol=1, pt.cex=1, cex=0.6)

# plot DateTime vs Global_reactive_power

plot(sub_hpc_data$DateTime, sub_hpc_data$Global_reactive_power, type="l", xlab ="datetime", ylab = "Global_reactive_power", yaxt="n")
ticks = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5)
axis(side = 2, at = ticks, cex.axis=0.8)

dev.copy(png, file = "./figure/plot4.png") ## Copy my plot to a PNG file
dev.off() ## close the PNG device

