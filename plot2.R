plot2 <- function() 
{
    source("loadData.R")
    
    # Load the data    
    power <- loadData()
    
    # Generate the plot
    # Sorry about the day of week labels
    # I tried using Sys.setlocale("LC_TIME", "en_US") but it didn't work here
    time <- ymd_hms(paste(as.character(power$Date), as.character(power$Time)))
    par(mar=c(4,4,3,1))
    plot(as.numeric(power$Global_active_power) ~ time,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")

    # save the results
    dev.copy(png, file = "plot2.png")
    dev.off()
}