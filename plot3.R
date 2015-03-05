
loadData <- function () {
    household <- read.table("household_power_consumption.txt", header=TRUE, na.strings = c("?"), sep=';');
    household$Time <- as.POSIXct(strptime(paste(household$Date, household$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
    household$Date = as.Date(household$Date, format="%d/%m/%Y")
    household_subset <-filter(household, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
}


plot3 <- function () {
    loadData()
    png("plot3.png")
    plot(household_subset$Time, household_subset$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
    lines(household_subset$Time, household_subset$Sub_metering_1)
    lines(household_subset$Time, household_subset$Sub_metering_2, col="red")
    lines(household_subset$Time, household_subset$Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
    dev.off()
}

