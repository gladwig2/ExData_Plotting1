# Coursera Exploratory Data Analysis
# plot 3


library(dplyr)
fn = "./exdata_data_household_power_consumption/household_power_consumption.txt"
col_names <- names(read.csv(fn, nrows = 1,  sep = ";"))
df = read.csv(fn, sep = ";", stringsAsFactors=FALSE, skip = 66636, nrows = 2880, 
              header=TRUE, na.strings = "?",
              col.names = col_names)
dfe = mutate(df, dateTime = as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))


plot(dfe$dateTime, dfe$Sub_metering_1, type = "n", main = "Global Active Power",
     xlab = "", ylab = "Energy Sub Metering " )
lines(dfe$dateTime, dfe$Sub_metering_1, col="black")
lines(dfe$dateTime, dfe$Sub_metering_2, col="red")
lines(dfe$dateTime, dfe$Sub_metering_3, col="blue")
legend("topright",  col = c("black", "red", "blue"),lty=1, cex=0.8, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# default png resolution is 480x480
dev.copy(png, "Plot3.png")  
dev.off()
