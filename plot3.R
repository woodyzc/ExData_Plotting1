library(dplyr)
#load the power data, use dplyr for manipulation.
allData<- read.csv('household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
allData<- tbl_df(allData)

# change Date and Time into character, then filter out data from 2007-02-01 and 2007-02-02.
# create a new column contains both Date and Time.
allData<- mutate(allData,Date=as.character(Date),Time=as.character(Time))
Data2007<- filter(new,Date%in% c('1/2/2007','2/2/2007'))
Data2007<- mutate(Data2007,DT=(paste(Date,Time)))

#save the plot to png
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(strptime(Data2007$DT,"%Y-%m-%d %H:%M:%S"),Data2007$Sub_metering_1,xlab='',ylab='Energy sub metering',type = 'l',col='black')
lines(strptime(Data2007$DT,"%Y-%m-%d %H:%M:%S"),Data2007$Sub_metering_2,col= 'red')
lines(strptime(Data2007$DT,"%Y-%m-%d %H:%M:%S"),Data2007$Sub_metering_3,col= 'blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="l",lwd=2)
dev.off()