
## Import the household power consumption (hpc) Dataset
hpc_data = read.table("./data/household_power_consumption.txt", sep = ";", header=TRUE, na.strings=c("NA", "-", "?"))

# from the hpc_data, subset the data (sub_hpc_data) only for the dates 2007-02-01 and 2007-02-02.
sub_hpc_data  <- subset(hpc_data, hpc_data$Date=="1/2/2007" | hpc_data$Date=="2/2/2007")

# Save this subsetted data by writing it to the local 'data' folder as sub_hpc_data.csv file. This file
# will be loaded and used to create plots in plot1.R (this file), plot2.R, plot3.R and plot4.R. 
write.table(sub_hpc_data, "./data/sub_hpc_data.csv", sep = ",", row.names = FALSE)

# Plot a Global_active_power vs frequency histogram graph.
hist(sub_hpc_data$Global_active_power, main = "Global Active Power", xlab="Global Active Power(Kilowatts)", col = "red") 

dev.copy(png, file = "./figure/plot1.png") ## Copy plot1.png to a PNG file and save it in figure folder
dev.off() ## close the PNG device
