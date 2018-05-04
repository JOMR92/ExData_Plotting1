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
png(filename="plot2.png")
#Starting plot #2: Simple line plot of GAP vs Day of the week
plot(df2007$datetime, df2007$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (Kilowatts)")
#dev.off
dev.off()


