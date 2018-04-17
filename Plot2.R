# Coursera Exploratory Data Analysis
# plot 2


library(dplyr)
fn = "./exdata_data_household_power_consumption/household_power_consumption.txt"
col_names <- names(read.csv(fn, nrows = 1,  sep = ";"))
df = read.csv(fn, sep = ";", stringsAsFactors=FALSE, skip = 66636, nrows = 2880, 
              header=TRUE, na.strings = "?",
              col.names = col_names)
dfe = mutate(df, dateTime = as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))


#hist(dfe$Global_active_power, col="red", 
#     breaks = 16, main = "Global Active Power", xlab = "Global Active Power (killowatts)")


plot(dfe$dateTime, dfe$Global_active_power, type = "n", main = "Global Active Power",
     xlab = "", ylab = "Global Active Power (killowatts)")
lines(dfe$dateTime, dfe$Global_active_power)

# default png resolution is 480x480
dev.copy(png, "Plot2.png")  
dev.off()
