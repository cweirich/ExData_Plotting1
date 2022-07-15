plot3 <- function() 
{
    source("loadData.R")
    
    # Load the data    
    power <- loadData()
    
    # Generate the plot
    # Sorry about the day of week labels
    # I tried using Sys.setlocale("LC_TIME", "en_US") but it didn't work here
    time <- ymd_hms(paste(as.character(power$Date), as.character(power$Time)))
    par(mar=c(4,4,3,1))
    plot(as.numeric(power$Sub_metering_1) ~ time,
         type="l",
         xlab="",
         ylab="Energy sub metering")
    
    points(as.numeric(power$Sub_metering_2) ~ time,
           type="l",
           col="red")
    
    points(as.numeric(power$Sub_metering_3) ~ time,
           type="l",
           col="blue")
    
    legend("topright",
           names(power)[7:9],
           col = c("black", "red", "blue"),
           lty=1)

    # save the results
    dev.copy(png, file = "plot3.png")
    dev.off()
}