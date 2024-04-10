library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "US")

h1<- read_csv2("household_power_consumption.txt", 
                col_types=c("c", "c", "n", "n","n","n","n","n","n"),
                col_names = TRUE) %>%
  mutate(Date=dmy(Date), 
         Date_Time=paste(Date, Time, sep=""), 
         Global_active_power=as.numeric(Global_active_power),
         Sub_metering_1 = as.numeric(Sub_metering_1),
         Sub_metering_2 = as.numeric(Sub_metering_2),
         Sub_metering_2 = as.numeric(Sub_metering_2),
         ) %>%
  mutate(Date_Time=ymd_hms(Date_Time, locale = Sys.getlocale("LC_TIME"))) %>%
  filter(Date>=ymd("2007-02-01"), Date<=ymd("2007-02-02"))
  

png("plot3.png", width=480, height=480)


plot(h1$Date_Time, h1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(h1$Date_Time, h1$Sub_metering_2,col="red")
lines(h1$Date_Time, h1$Sub_metering_3,col="blue")

legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()