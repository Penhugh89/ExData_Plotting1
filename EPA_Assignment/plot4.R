## Set working directory
setwd("C:/Users/Penelope/Documents/Data Science Specialization Course/Exploratory Data Analysis/ExData_Plotting1/EPA_Assignment")

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file (url, "energydata")
datedownloaded <- date()
datedownloaded

## choose a file and save its file path in R 
zipF<-file.choose() 

## Define the folder where the zip file should be unzipped to 
outDir<-"C:/Users/Penelope/Documents/Data Science Specialization Course/Exploratory Data Analysis/ExData_Plotting1/EPA_Assignment" 

## unzip file             
unzip(zipF,exdir=outDir) 

## Read the cvs file and store it in a variable called endata as a dataframe in R
endata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## View data
View(endata)

## Convert the values in Date column from a character format to a Date format in R
endata$Date <- as.Date(endata$Date, format = "%d/%m/%Y")

## Create a new dataframe named engdata as a subset of endata for the date range 2007-02-01 to 2007-02-02
engdata <- subset(endata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Create a new column called datetime by combining the Date and Time columns of the engdata framework
datetime <- paste(as.Date(engdata$Date), engdata$Time)

## Convert the datetime variable from a character type to the POSITct type 
engdata$Datetime <- as.POSIXct(datetime)

## Plot 4
## Set graphical parameters for Creating multiple plots within a single graphics device
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Create three line plots in R 
with(engdata, {
plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Add an additional line to the three existing plots and add a legend
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create a line plot in R for the relationship between Global reactive power and Datetime variables 
plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
## Copy the current plot to a PNG file named plot4.png with a specific height and width
dev.copy(png, file="plot1.png", height=480, width=480)

## Close the current graphical device
dev.off() 