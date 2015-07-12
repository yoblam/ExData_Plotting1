#Project 1 - Plot 1
  setwd("F:/Coursera/Exploratory Data Analysis/Course_Projects/Project_1")
  df<-read.csv("household_power_consumption.txt",header=TRUE, sep=";",nrows=2075259)#100000)

#Acquire data from the dates 2007-02-01 and 2007-02-02
  date<-as.character(df$Date) # convert factor to character 
  date<-as.Date(date,"%d/%m/%Y")
  index<-which(date>="2007-02-01" & date<= "2007-02-02")
  df<-df[index,]
  
#Add new column "Date_Time"
  fcol<-which(sapply(df,class)=="factor")
  df[fcol] <- lapply(df[fcol], as.character) 
  df[3:ncol(df)]<-lapply(df[3:ncol(df)],as.numeric)
  date_time<-paste(df[,1],df[,2], sep= " ")
  date_time<-strptime(date_time, format="%d/%m/%Y %H:%M:%S")
  df<-cbind(Date_Time=date_time,df)
  
#Plot 2
  png(filename="Plot 2.png",width = 480, height = 480, units = "px")
  plot(df$Global_active_power~df$Date_Time,xlab="",ylab="Global Active Power (kilowatts)",type="l")
  dev.off()