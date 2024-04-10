library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "US")

h1<- read_csv2("household_power_consumption.txt", 
                col_types=c("c", "c", "n", "n","n","n","n","n","n"),
                col_names = TRUE) %>%
  mutate(Date=dmy(Date), Date_Time=paste(Date, Time, sep=""), Global_active_power=as.numeric(Global_active_power)) %>%
  mutate(Date_Time=ymd_hms(Date_Time, locale = Sys.getlocale("LC_TIME"))) %>%
  filter(Date>=ymd("2007-02-01"), Date<=ymd("2007-02-02"))
  

png("plot2.png", width=480, height=480)


plot(x=h1$Date_Time, y= h1$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()