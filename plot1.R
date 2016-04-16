library(dplyr)
allData<- read.csv('household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
allData<- tbl_df(allData)

allData<- mutate(allData,Date=as.character(Date),Time=as.character(Time))
Data2007<- filter(new,Date%in% c('1/2/2007','2/2/2007'))
Data2007<- mutate(Data2007,DT=(paste(Data,Time)))

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(Data2007$Global_active_power,col='red',xlab = 'Global Active Power (kilowatts)',main='Global Active Power')
dev.off()