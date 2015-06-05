library(sqldf)

#Read file using the sqldf library
household <- read.csv.sql("household_power_consumption.txt", sep=";",
                          sql = "SELECT * FROM file 
                          WHERE Date in ('1/2/2007', '2/2/2007')")

#Change Date column from char->Date
#Convert combined Date/Time into a POSIXct object
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household$datetime <- as.POSIXct(paste(household$Date, household$Time), 
                                 format="%Y-%m-%d %H:%M:%S")

#Plot 1
png(filename="plot1.png")
hist(household$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red", ylim=c(0,1200))
dev.off()







