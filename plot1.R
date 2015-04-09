
#Set working directory to that of this script
scriptDirectory <- dirname(parent.frame(2)$ofile)
setwd(scriptDirectory)

#Source utility functions
source("Util.R")

#Load and subset the dataset (see the Util.R file for the loadData function)
inputData <- loadData()
powerData <- subset(inputData, inputData$Date==as.Date("2007-02-01") | inputData$Date==as.Date("2007-02-02"))

#Make the plot
png("plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, freq=TRUE,
     col="Red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()