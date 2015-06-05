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

#Plot 2
png(filename="plot2.png")
plot(household$datetime, household$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
