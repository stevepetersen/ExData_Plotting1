
loadData <- function () {
    household <- read.table("household_power_consumption.txt", header=TRUE, na.strings = c("?"), sep=';');
    household$Time <- as.POSIXct(strptime(paste(household$Date, household$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
    household$Date = as.Date(household$Date, format="%d/%m/%Y")
    household_subset <-filter(household, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
}

plot2 <- function () {
    loadData()
    png("plot2.png")
    plot(household_subset$Time, household_subset$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n")
    lines(household_subset$Time, household_subset$Global_active_power)
    dev.off()
}

