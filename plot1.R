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

#-------------------------------------------

# 5. Plot 1: Historgram of Global_active_power
HPD_subset <- subset(house_power_data, dmy(Date) %in% c(dmy('01/02/2007'),dmy('02/02/2007')))
png("plot1.png", width=480, height=480)
hist(HPD_subset$Global_active_power, col = 'red', xlim = c(0,6), 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

