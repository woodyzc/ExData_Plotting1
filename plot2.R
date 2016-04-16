library(dplyr)
allData<- read.csv('household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
allData<- tbl_df(allData)
new_names<- gsub('_',' ',names(allData))
names(allData)<- new_names

allData<- mutate(allData,Date=as.character(Date),Time=as.character(Time))
Data2007<- filter(new,Date%in% c('1/2/2007','2/2/2007'))
Data2007<- mutate(Data2007,DT=(paste(Data,Time)))

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(strptime(Data2007$DT,"%Y-%m-%d %H:%M:%S"),Data2007$Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type = 'l')
dev.off()