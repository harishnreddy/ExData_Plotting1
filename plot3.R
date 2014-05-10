
#Exploratory Data Analysis
#Assignement 1
#Plot 3

print("executing Plot 3")

setwd("/Users/harishreddy/Google Drive/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")


# read table
dat <- read.table("../household_power_consumption.txt", 
                  header = TRUE, 
                  sep=";",
                  colClasses = c("character", "character", 
                                 "character", "character", 
                                 "character", "character", 
                                 "character", "character", 
                                 "character")
                  )

#subset on date

dat2 <- subset(dat,(dat$Date=="1/2/2007")|(dat$Date=="2/2/2007"))

#create date/time, remove date and time column

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

png(file="plot3.png")

with(dat2, plot(DateTime, 
                Sub_metering_1, 
                type="l", 
                ylab="Energy sub metering",
                xlab="",
                col="black"),
     width=480,
     height=480)
lines(dat2$DateTime,dat2$Sub_metering_2,type="l",col="red")
lines(dat2$DateTime,dat2$Sub_metering_3,type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend= c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))

dev.off()

