#loading required packages
library(lubridate)
library(dplyr)
library(data.table)
#reading the database
df <- fread("/Users/jomr/Desktop/Coursera/EDA/Week 1/household_power_consumption.txt",na.strings="?")
#checking the structure
str(df)
#turning date into proper formats
df$Date <- dmy(df$Date)
#subsetting according to date
df2007 <- filter(df, (Date=="2007-02-01" | Date=="2007-02-02"))
#turning time into proper format
df2007$Time <- hms(df2007$Time)
#Pasting date and time variables
df2007$datetime <- paste(df2007$Date,df2007$Time, sep = "-")
#Parsing dates
df2007$datetime <- parse_date_time(df2007$datetime,c("ymd HMS", "ymd MS"), truncated=3)
#setting "png" graphic device
png(filename="plot3.png")
#Starting plot #3: Energy sub metering vs day of the week
with(df2007, plot (datetime, Sub_metering_1,  type="n", ylab="Energy Sub Metering", xlab=""))
with(df2007, lines(datetime, Sub_metering_1))
with(df2007, lines(datetime, Sub_metering_2, col="red"))
with(df2007, lines(datetime, Sub_metering_3, col ="blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#dev.off
dev.off()