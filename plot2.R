
## Import the subsetted household power consumption (sub_hpc_data) Dataset that was created in plot1.R
sub_hpc_data = read.csv("./data/sub_hpc_data.csv", header=TRUE)

# Combine and Format the Date and Time columns.
sub_hpc_data$DateTime = strptime( apply( sub_hpc_data[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

# Plot DateTime vs Global_active_power graph.
plot(sub_hpc_data$DateTime, sub_hpc_data$Global_active_power,  type="l", xlab ="", ylab = "Global Active Power(Kilowatts)")

dev.copy(png, file = "./figure/plot2.png")  # Copy plot2.png to a PNG file and save it in figure folder
dev.off() ## close the PNG device
