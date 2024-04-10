library(dplyr)
library(lubridate)

h1<- read_csv2("household_power_consumption.txt", 
                col_types=c("c", "t", "n", "n","n","n","n","n","n"),
                col_names = TRUE) %>%
  mutate(Date=dmy(Date), Global_active_power=as.numeric(Global_active_power)) %>%
  filter(Date>=ymd("2007-02-01"), Date<=ymd("2007-02-02"))
  

png("plot1.png", width=480, height=480)


hist(h1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()