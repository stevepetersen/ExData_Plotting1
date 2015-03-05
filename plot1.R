
loadData <- function () {
    household <- read.table("household_power_consumption.txt", header=TRUE, na.strings = c("?"), sep=';');
    household$Time <- as.POSIXct(strptime(paste(household$Date, household$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
    household$Date = as.Date(household$Date, format="%d/%m/%Y")
    household_subset <-filter(household, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
}

plot1 <- function () {
    loadData()
    png("plot1.png")
    hist(household_subset$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
    dev.off()
}

