plot1 <- function() 
{
    source("loadData.R")

    # load the data    
    power <- loadData()
    
    # generate the histogram
    hist(as.numeric(power$Global_active_power),
         col="red",
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    
    # save the results
    dev.copy(png, file = "plot1.png")
    dev.off()
}