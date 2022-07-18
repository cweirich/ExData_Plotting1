plot4 <- function() 
{
    source("loadData.R")
    
    # Load the data    
    power <- loadData()
    
    # Generate the plots
    # Sorry about the day of week labels
    # I tried using Sys.setlocale("LC_TIME", "en_US") but it didn't work here
    time <- ymd_hms(paste(as.character(power$Date), as.character(power$Time)))
    png("plot4.png") 
    par(mar=c(4,4,3,2))
    par(mfrow=c(2,2))
    
    #top left plot
    plot(as.numeric(power$Global_active_power) ~ time,
         type="l",
         xlab="",
         ylab="Global Active Power")
    
    #top right plot
    plot(as.numeric(power$Voltage) ~ time,
         type="l",
         xlab="datetime",
         ylab="Voltage")
    
    #bottom left plot
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
           lty=1,
           bty="n")
    
    #bottom right plot
    plot(as.numeric(power$Global_reactive_power) ~ time,
         type="l",
         xlab="datetime",
         ylab="Global_reactive_power")
    
    # save the results
    dev.off()
}