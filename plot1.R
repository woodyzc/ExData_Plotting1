library(dplyr)
allData<- read.csv('household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
allData<- tbl_df(allData)
new_names<- gsub('_',' ',names(allData))
names(allData)<- new_names

allData<- mutate(allData,Date=as.character(Date),Time=as.character(Time))
Data2007<- filter(new,Date%in% c('1/2/2007','2/2/2007'))
png(file = "plot1.png", width = 480, height = 480, units = "px")
with(Data2007,hist(Global_active_power,col='red',xlab = 'Global Active Power (kilowatts)',main='Global Active Power'))
dev.off()