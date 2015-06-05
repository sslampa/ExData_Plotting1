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

#Plot 3
png(filename="plot3.png")
with(household, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(household, lines(datetime, Sub_metering_2, type="l", col="red"))
with(household, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c("black", "red", "blue"))
dev.off()
