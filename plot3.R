# Exploratory Data Analysis. Week 1. Course Project 1.
# Made by Alexander
# Date: 25.02.2016
# WARNING: This script was made for running on my own machine. For correct running you don't need to use part
#          of the script that called "work directory"
# ------------------------------------------
# 1. library
library(lubridate) # for function DMY
#-------------------------------------------

# 2. work directory
setwd("D:\\yandex_disk\\Big_Data\\Course_4_Exploratory_Data_Analysis")
if (!file.exists("Project_1")) {dir.create("Project_1")} # if dir doesn't exist then create the dir
setwd("D:\\yandex_disk\\Big_Data\\Course_4_Exploratory_Data_Analysis\\Project_1")
#-------------------------------------------

# 3. Download and unzip dataset
URL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
dist_zip <- 'household_power_consumption.zip'
if (!file.exists(dist_zip)) {download.file(URL, dist_zip)} #download zip-file to work directory
if (!file.exists('household_power_consumption.txt')) {unzip(dist_zip)}
#-------------------------------------------

# 4. Load data that describe labels for activities and features
house_power_data <- read.table('household_power_consumption.txt', 
                               sep = ';', na.strings = '?', 
                               header = TRUE,
                               dec = ".") #Links the class labels with their activity name
#head (house_power_data)
#str(house_power_data)

house_power_data$Date <- as.Date(house_power_data$Date, '%d/%m/%Y' )
HPD_subset <- subset(house_power_data, Date == '2007-02-01'|Date == '2007-02-02')
HPD_subset$Date.Time <- strptime(paste(HPD_subset$Date, HPD_subset$Time),format="%Y-%m-%d %H:%M:%S")
#-------------------------------------------

# 5. Plot 3
png("plot3.png", width=480, height=480)
plot(HPD_subset$Date.Time,
     HPD_subset$Sub_metering_1,
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering')
lines(HPD_subset$Date.Time,
      HPD_subset$Sub_metering_2,
      type = 'l',
      col = 'red'
)
lines(HPD_subset$Date.Time,
      HPD_subset$Sub_metering_3,
      type = 'l',
      col = 'blue'
)
legend('topright',
       lty = c(1, 1, 1),
       col = c('black', 'red', 'blue'),
       legend = c('Sub_Metering_1', 'Sub_Metering_2', 'Sub_Metering_3'))
dev.off()
