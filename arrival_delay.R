survey <- read.csv("Satisfaction Shloak.csv")
View(survey)
summary(survey)

hist(survey$Eating.and.Drinking.at.Airport)
arrivaldel <- function(vec1, vec){
  
  vBuckets <- replicate(length(vec),"No Delay")
  vBuckets[is.na(vec) & vec1 == 'Yes'] <- "Cancelled"
  vBuckets[vec > 0 & vec < 5] <- "5 minutes"
  vBuckets[vec >= 5 & vec < 30] <- "half hours"
  vBuckets[vec >= 30 & vec < 60] <- "1 hours"
  vBuckets[vec >= 60 & vec < 120] <- "2 hours"
  vBuckets[vec >= 120] <- "more than 2 hours"
  return (vBuckets)
  }

survey$arrivalDelay <-arrivaldel(survey$Flight.cancelled, survey$Arrival.Delay.in.Minutes)
str(survey)

survey$DepartureDelay <- arrivaldel(survey$Flight.cancelled,survey$Departure.Delay.in.Minutes)

survey <- subset(survey, select =-c(Arrival.Delay.greater.5.Mins))
survey <- subset(survey, select =-c(Arrival.Delay.in.Minutes,Departure.Delay.in.Minutes))
write.csv(survey, "Satisfaction Survey v5.csv")


