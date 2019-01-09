setwd("C:/Users/jason/Desktop/jason/syracuse/IST687/project")
ProjectData = read.csv('surveyDataV7.csv')
#Avg_Satisfaction group by weekday
library(sqldf)
sqldf("Select * from ProjectData Group By weekday='Monday' ")
a <- ProjectData[ProjectData$weekday=='Monday',]
a
write.csv(a, file = "Monday.csv")
sqldf("Select * from ProjectData Group By weekday='Tuesday' ")
b <- ProjectData[ProjectData$weekday=='Tuesday',]
b
write.csv(b, file = "Tuesday.csv")
sqldf("Select * from ProjectData Group By weekday='Wednesday' ")
c <- ProjectData[ProjectData$weekday=='Wednesday',]
c
write.csv(c, file = "Wednesday.csv")
#Thursday
sqldf("Select * from ProjectData Group By weekday='Thursday' ")
d <- ProjectData[ProjectData$weekday=='Thursday',]
d
write.csv(d, file = "Thursday.csv")
#Friday
sqldf("Select * from ProjectData Group By weekday='Friday' ")
e <- ProjectData[ProjectData$weekday=='Friday',]
e
write.csv(e, file = "Friday.csv")
#Satursday
sqldf("Select * from ProjectData Group By weekday='Saturday' ")
f <- ProjectData[ProjectData$weekday=='Saturday',]
f
write.csv(f, file = "Satursday.csv")
#Sunday
sqldf("Select * from ProjectData Group By weekday='Sunday' ")
g <- ProjectData[ProjectData$weekday=='Sunday',]
g
write.csv(a, file = "Sunday.csv")

Monday <- read.csv("Monday.csv")
Tuesday <- read.csv("Tuesday.csv")
Wednesday <- read.csv("Wednesday.csv")
Thursday <- read.csv("Thursday.csv")
Friday <- read.csv("Friday.csv")
Satursday <- read.csv("Satursday.csv")
Sunday <- read.csv("Sunday.csv")
average1 <- mean(Monday$Satisfaction)
average1
average2 <- mean(Tuesday$Satisfaction)
average2
average3 <- mean(Wednesday$Satisfaction)
average3
average4 <- mean(Thursday$Satisfaction)
average4
average5 <- mean(Friday$Satisfaction)
average5
average6 <- mean(Satursday$Satisfaction)
average6
average7 <- mean(Sunday$Satisfaction)
average7
total_average()
library(ggplot2)
x <- data.frame("Weekday" = c("Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"),"Average_Satisfaction"=c(average1,average2,average3,average4,average5,average6,average7))
write.csv(x, file = "Weekday.csv")
x <- read.csv("Weekday.csv")

graph <-ggplot(data=x, aes(x=Weekday, y=Average_Satisfaction)) +
  geom_point(colour= "red", size=6)
graph

#Avg_Satisfaction group by gender
sqldf("Select * from ProjectData Group By Gender ="Male" ")
m <- ProjectData[ProjectData$Gender=="Male",]
m
View(m)
averagesatmale <- mean(m$Satisfaction)
averagesatmale

sqldf("Select * from ProjectData Group By Gender ="Female" ")
fm <- ProjectData[ProjectData$Gender=="Female",]
fm
View(fm)
averagesatfemale <- mean(fm$Satisfaction)
averagesatfemale
y<- data.frame("Gender" = c("Male","Female"), "average"=c(averagesatmale,averagesatfemale))

graph <-ggplot(data=y, aes(x=Gender, y=average)) + geom_point(colour= "red", size=6)
graph

# Avg_Satisfaction group by Arrival delay
setwd("C:/Users/jason/Desktop/jason/syracuse/IST687/project")
ProjectData1 = read.csv('surveyDataV7_1.csv')

sqldf("Select * from ProjectData Group By arrivalDelay ="No Delay" ")
n1 <- ProjectData1[ProjectData1$arrivalDelay.1=="No Delay",]
n1
View(n1)
averagesat1 <- mean(n1$Satisfaction)
averagesat1

n2 <- ProjectData1[ProjectData1$arrivalDelay.1=="half hours",]
n2
averagesat2 <- mean(n2$Satisfaction)
averagesat2

n3 <- ProjectData1[ProjectData1$arrivalDelay.1=="1 hours",]
n3
averagesat3 <- mean(n3$Satisfaction)
averagesat3

n4 <- ProjectData1[ProjectData1$arrivalDelay.1=="2 hours",]
n4
averagesat4 <- mean(n4$Satisfaction)
averagesat4

n5 <- ProjectData1[ProjectData1$arrivalDelay.1=="5 minutes",]
n5
averagesat5 <- mean(n5$Satisfaction)
averagesat5

n6 <- ProjectData1[ProjectData1$arrivalDelay.1=="Cancelled",]
n6
averagesat6 <- mean(n6$Satisfaction)
averagesat6

n7 <- ProjectData1[ProjectData1$arrivalDelay.1=="more than 2 hours",]
n7
averagesat7 <- mean(n6$Satisfaction)
averagesat7

z<- data.frame("Arrival_delay" = c("No Delay","half hours","1 hours","2 hours","5 minutes","Cancelled","more than 2 hours"), "average_Satisfaction"=c(averagesat1,averagesat2,averagesat3,averagesat4,averagesat5,averagesat6,averagesat7))
write.csv(z, file = "Arrival_delay.csv")
z <- read.csv("Arrival_delay.csv")
graph <-ggplot(data=z, aes(x=Arrival_delay, y=average_Satisfaction)) + geom_point(colour= "red", size=6)
graph

