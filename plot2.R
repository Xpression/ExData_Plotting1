
#Set working directory to that of this script
scriptDirectory <- dirname(parent.frame(2)$ofile)
setwd(scriptDirectory)

#Source utility functions
source("Util.R")

#Load and subset the dataset (see the Util.R file for the loadData function)
inputData <- loadData()
powerData <- subset(inputData, inputData$Date==as.Date("2007-02-01") | inputData$Date==as.Date("2007-02-02"))

#Make the plot
png("plot2.png", width = 480, height = 480)
plot(powerData$Time, 
        powerData$Global_active_power,
        type="l", 
        ylab="Global Active Power (kilowatts)", 
        xlab="")
dev.off()