# Coursera Exploratory Data Analysis
# plot 4


library(dplyr)
fn = "./exdata_data_household_power_consumption/household_power_consumption.txt"
col_names <- names(read.csv(fn, nrows = 1,  sep = ";"))
df = read.csv(fn, sep = ";", stringsAsFactors=FALSE, skip = 66636, nrows = 2880, 
              header=TRUE, na.strings = "?",
              col.names = col_names)
dfe = mutate(df, dateTime = as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))


par(mfrow = c(2,2))
par(mar=c(2, 4.5, 1, 0.5))

# 1,1
plot(dfe$dateTime, dfe$Global_active_power, type = "n", 
     xlab = "", ylab = "Global Active Power")
lines(dfe$dateTime, dfe$Global_active_power)
# 1,2
plot(dfe$dateTime, dfe$Voltage, type = "n",
     xlab = "Datetime", ylab = "Voltage(V)")
lines(dfe$dateTime, dfe$Voltage)

# 2,1
plot(dfe$dateTime, dfe$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy Sub Metering " )
lines(dfe$dateTime, dfe$Sub_metering_1, col="black")
lines(dfe$dateTime, dfe$Sub_metering_2, col="red")
lines(dfe$dateTime, dfe$Sub_metering_3, col="blue")
legend("topright",  col = c("black", "red", "blue"),lty=1, cex=0.6, bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#2,2
plot(dfe$dateTime, dfe$Global_reactive_power, type = "n",
     xlab = "Datetime", ylab = "Global_Reactive_Power")
lines(dfe$dateTime, dfe$Global_reactive_power)



# default png resolution is 480x480
dev.copy(png, "Plot4.png")  
dev.off()
