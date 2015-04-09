
#Set working directory to that of this script
scriptDirectory <- dirname(parent.frame(2)$ofile)
setwd(scriptDirectory)

#Source utility functions
source("Util.R")

#Load and subset the dataset (see the Util.R file for the loadData function)
inputData <- loadData()
powerData <- subset(inputData, inputData$Date==as.Date("2007-02-01") | inputData$Date==as.Date("2007-02-02"))

#Make the plot
png("plot3.png", width = 480, height = 480)
plot(powerData$Time, 
     powerData$Sub_metering_1,
     type="l", 
     ylab="Energy sub metering", 
     xlab="")
lines(powerData$Time, powerData$Sub_metering_2,col="red")
lines(powerData$Time, powerData$Sub_metering_3,col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1),
       col=c("black", "red", "blue"))
dev.off()