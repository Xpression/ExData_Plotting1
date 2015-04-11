
# Helper function for downloading and unzipping data if it is not present
prepareData <- function(){
    if (!file.exists("./data")){
        dir.create("./data")
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                      "./data/household_power_consumption.zip", 
                      method="curl",
                      mode = "w")
        unzip("./data/household_power_consumption.zip", exdir = "./data")
    }
}

# Helper function for loading the data in a reasonable format
loadData <- function(){
    
    #Download and unzip data if necessary
    prepareData()
    
    #Extract the data
    inputData <- read.csv2("./data/household_power_consumption.txt", sep=";", dec=".", stringsAsFactors=FALSE)
    inputData$Global_active_power <- as.numeric(as.character(inputData$Global_active_power))
    inputData$Date <- as.Date(as.character(inputData$Date), format="%d/%m/%Y")
    inputData$Time <- strptime(paste(inputData$Date, as.character(inputData$Time)), format="%Y-%m-%d %H:%M:%S")
    inputData$Global_reactive_power <- as.numeric(as.character(inputData$Global_reactive_power))
    inputData$Voltage <- as.numeric(as.character(inputData$Voltage))
    inputData$Global_intensity <- as.numeric(as.character(inputData$Global_intensity))
    inputData$Sub_metering_1 <- as.numeric(as.character(inputData$Sub_metering_1))
    inputData$Sub_metering_2 <- as.numeric(as.character(inputData$Sub_metering_2))
    inputData$Sub_metering_3 <- as.numeric(as.character(inputData$Sub_metering_3))
    
    return(inputData)
} 