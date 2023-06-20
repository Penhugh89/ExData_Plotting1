##Set working directory
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

## Read the text file and store it in a variable called edata
edata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## View data
View(edata)

## Convert the values in Date column from a character format to a Date format in R
edata$Date <- as.Date(edata$Date, format = "%d/%m/%Y")

## Subset edata dataframe to include only rows that the date falls within 2007-02-01 and 2007-02-02
edata <- subset(edata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Create a new column called datetime in the edata framework
edata$datetime <- strptime(paste(edata$Date, edata$Time), "%Y-%m-%d %H:%M:%S")

## Create a histogram of the Global_active_power column in the edata dataframe with red histogram bars
hist(edata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Copy the histogram in R to a PNG file named plot1.png with a specific height and width
dev.copy(png, file="plot1.png", height=480, width=480)

## Close the current graphical device
dev.off()     

