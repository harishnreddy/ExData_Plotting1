
#Exploratory Data Analysis
#Assignement 1
#Plot 1

setwd("/Users/harishreddy/Google Drive/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

# read table
dat <- read.table("../household_power_consumption.txt", 
                  header = TRUE, 
                  sep=";",
                  colClasses = c("character", "character", "character", 
                                              "character", "character", "character", "character", 
                                              "character", "character")
                  )

#plot 1
#subset on date
dat2 <- subset(dat,(dat$Date=="1/2/2007")|(dat$Date=="2/2/2007"))

#create date/time, remove date and time column and coerce to numerics

dat2$DateTime <- paste(dat2$Date,dat2$Time)
dat2$DateTime <- strptime(dat2$DateTime,"%d/%m/%Y %H:%M:%S")

dat2$Time <- NULL
dat2$Date <- NULL

dat2[,1] <- as.numeric(dat2[,1])
dat2[,2] <- as.numeric(dat2[,2])
dat2[,3] <- as.numeric(dat2[,3])
dat2[,5] <- as.numeric(dat2[,5])
dat2[,6] <- as.numeric(dat2[,6])
dat2[,7] <- as.numeric(dat2[,7])

dat2 <- subset(dat2, dat2[,7] != "?")

par(mfrow=c(1,1))
hist(dat2$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

