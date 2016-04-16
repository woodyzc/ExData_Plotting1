library(dplyr)
#load the power data, use dplyr for manipulation.
allData<- read.csv('household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
allData<- tbl_df(allData)

# change Date and Time into character, then filter out data from 2007-02-01 and 2007-02-02.
# create a new column contains both Date and Time.
allData<- mutate(allData,Date=as.character(Date),Time=as.character(Time))
Data2007<- filter(allData,Date%in% c('1/2/2007','2/2/2007'))
Data2007<- mutate(Data2007,DT=(paste(Date,Time)))

#save the plot to png
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(strptime(Data2007$DT,"%d/%m/%Y %H:%M:%S"),Data2007$Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type = 'l')
dev.off()