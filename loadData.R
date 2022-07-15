loadData <- function() 
{
    library(readr)
    library(lubridate)
    library(dplyr)
    file <- "household_power_consumption.txt"
    data <- read_csv2( file = file )
    data$Date <- dmy(data$Date)
    data <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
}