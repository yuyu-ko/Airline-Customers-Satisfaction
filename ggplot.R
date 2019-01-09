#IST687
#YuYu Ko
#Homework#8
#10/25/2018
#10/24/2018

# Part A: Load and condition the data  
# 1.	The data is available on blackboard (hotelSurveySherison), as a JSON file.
# Hint: Don't forget to use setwd() to make sure that R is looking in the right folder for your text file.
setwd("C:/Users/jason/Desktop/jason/syracuse/IST687/project")
AirplainSatisfaction = read.csv('surveyDataV7.csv')


# 2.	Use the str command to make sure you can see the following attributes
# overallCustSat: Overall customer satisfaction (based on survey response)
# hotelSize:     	The size of the hotel (number of rooms in the hotel)
# gender:        	 gender of the customer
# guestAge:      	 age of the guest (in years)
# lengthOfStay:  nights at the hotel
# whenBookedTrip: number of days before the trip the room was reserved
# checkInSat:   	The customer;s survey response to their checkin experience
# hotelState:    	The state (location) of the hotel - in the united states
# hotelClean:    	The customer's survey response on the cleanliness of the hotel
# hotelFriendly: The customer's survey response on the friendliness of the staff
# freeText: 	free form customer comments
str(AirplainSatisfaction)

# Step B: Explore the data  
# 3.	Create bivariate plots for each of the attributes.
# Your code should produce nine separate plots. Make sure the Y-axis and X-axis are labeled. 
#Keeping in mind that the overall customer satisfacation is the outcome (or dependent) variable, which axis should it go on in your plots?
# Hint: use the jitter command, so you can see all the surveys (something such as) jitter(hotelSurvey$checkInSat)
# Satisfaction <- jitter(AirplainSatisfaction$Satisfaction)
# Age <- jitter(AirplainSatisfaction$Age)
# Gender_cat <- jitter(AirplainSatisfaction$Gender_cat)
# Price.Sensitivity <- jitter(AirplainSatisfaction$Price.Sensitivity)
# Years.Old <- jitter(AirplainSatisfaction$Years.Old)
# No.of.Flights.p.a. <- jitter(AirplainSatisfaction$No.of.Flights.p.a.)
# Type_travel_cat <- jitter(AirplainSatisfaction$Type_travel_cat)
# No..of.other.Loyalty.Cards <- jitter(AirplainSatisfaction$No..of.other.Loyalty.Cards)
# Class <- jitter(AirplainSatisfaction$Class)
# Scheduled.Departure.Hour <- jitter(AirplainSatisfaction$Scheduled.Departure.Hour)
# Flight.Distance <- jitter(AirplainSatisfaction$Flight.Distance)
# arrivalDelay <- jitter(AirplainSatisfaction$arrivalDelay)
# DepartureDelay <- jitter(AirplainSatisfaction$DepartureDelay)
# shop_at_airport <- jitter(AirplainSatisfaction$shop_at_airport)
# AirlineStatus <- jitter(AirplainSatisfaction$AirlineStatus)

library(ggplot2)
plt <- ggplot(AirplainSatisfaction, aes(x=Age,y=Satisfaction)) + geom_point()
plt
plt1 <- ggplot(AirplainSatisfaction, aes(x=Gender_cat,y=Satisfaction)) + geom_point()
plt1
plt2 <- ggplot(AirplainSatisfaction, aes(x=Price.Sensitivity,y=Satisfaction)) + geom_point()
plt2
plt3 <- ggplot(AirplainSatisfaction, aes(x=Years.Old,y=Satisfaction)) + geom_point()
plt3
plt4 <- ggplot(AirplainSatisfaction, aes(x=No.of.Flights.p.a.,y=Satisfaction)) + geom_point()
plt4
plt5 <- ggplot(AirplainSatisfaction, aes(x=Type_travel_cat,y=Satisfaction)) + geom_point()
plt5
plt6 <- ggplot(AirplainSatisfaction, aes(x=No..of.other.Loyalty.Cards,y=Satisfaction)) + geom_point()
plt6
plt7 <- ggplot(AirplainSatisfaction, aes(x=Class,y=Satisfaction)) + geom_point()
plt7
plt8 <- ggplot(AirplainSatisfaction, aes(x=Scheduled.Departure.Hour,y=Satisfaction)) + geom_point()
plt8
plt9 <- ggplot(AirplainSatisfaction, aes(x=Flight.Distance,y=Satisfaction)) + geom_point()
plt9
plt10 <- ggplot(AirplainSatisfaction, aes(x=arrivalDelay,y=Satisfaction)) + geom_point()
plt10
plt11 <- ggplot(AirplainSatisfaction, aes(x=DepartureDelay,y=Satisfaction)) + geom_point()
plt11
plt12 <- ggplot(AirplainSatisfaction, aes(x=shop_at_airport,y=Satisfaction)) + geom_point()
plt12
plt13 <- ggplot(AirplainSatisfaction, aes(x=AirlineStatus,y=Satisfaction)) + geom_point()
plt13








printcp(classifier)
plotcp(classifier)


# Predicting the Test set results
# y_pred = predict(classifier, test_set)
# y_pred
# # Making the Confusion Matrix
# cm = table(test_set[, 3], y_pred)

# Visualising the Training set results
#install.packages("ElemStatLearn")
# library(ElemStatLearn)
# set = training_set
# X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.0075)
# X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.0075)
# grid_set = expand.grid(X1, X2)
# colnames(grid_set) = c('Age', 'EstimatedSalary')
# y_grid = predict(classifier, newdata = grid_set, type = 'class')
# plot(set[, -3],
#      main = 'Decision Tree (Training set)',
#      xlab = 'Age', ylab = 'Estimated Salary',
#      xlim = range(X1), ylim = range(X2))
# contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
# points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
# points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
# 
# # Visualising the Test set results
# library(ElemStatLearn)
# set = test_set
# X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.0075)
# X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.0075)
# grid_set = expand.grid(X1, X2)
# colnames(grid_set) = c('Age', 'EstimatedSalary')
# y_grid = predict(classifier, newdata = grid_set, type = 'class')
# plot(set[, -3], main = 'Decision Tree (Test set)',
#      xlab = 'Age', ylab = 'Estimated Salary',
#      xlim = range(X1), ylim = range(X2))
# contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
# points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
# points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
# 
# # Plotting the decision tree
plot(classifier)
 text(classifier)
 
 
 #Age
 ggplot(AirplainSatisfaction,aes(y=Satisfaction, x=Age)) +geom_point()
 AirplainSatisfaction$SatisfactionJ <- jitter(AirplainSatisfaction$Satisfaction)
 AirplainSatisfaction$AgeJ <- jitter(AirplainSatisfaction$Age)
 ggplot(AirplainSatisfaction,aes(x=AgeJ,y=SatisfactionJ))+geom_point()
 
 #Price.Sensitivity
 ggplot(AirplainSatisfaction,aes(y=Satisfaction, x=Price.Sensitivity)) +geom_point()
 AirplainSatisfaction$SatisfactionJ <- jitter(AirplainSatisfaction$Satisfaction)
 AirplainSatisfaction$Price.SensitivityJ <- jitter(AirplainSatisfaction$Price.Sensitivity)
 ggplot(AirplainSatisfaction,aes(x=Price.SensitivityJ,y=SatisfactionJ))+geom_point()
 
 #No.of.Flights.p.a.
 ggplot(ProjectData,aes(y=Satisfaction, x=No.of.Flights.p.a.)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$No.of.Flights.p.a.J <- jitter(ProjectData$No.of.Flights.p.a.)
 ggplot(ProjectData,aes(x=No.of.Flights.p.a.J,y=SatisfactionJ))+geom_point()
 
 #No..of.other.Loyalty.Cards
 ggplot(ProjectData,aes(y=Satisfaction, x=No..of.other.Loyalty.Cards)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$No..of.other.Loyalty.CardsJ <- jitter(ProjectData$No..of.other.Loyalty.Cards)
 ggplot(ProjectData,aes(x=No..of.other.Loyalty.CardsJ,y=SatisfactionJ))+geom_point()
 
 #No..of.other.Loyalty.Cards
 ggplot(ProjectData,aes(y=Satisfaction, x=No..of.other.Loyalty.Cards)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$No..of.other.Loyalty.CardsJ <- jitter(ProjectData$No..of.other.Loyalty.Cards)
 ggplot(ProjectData,aes(x=No..of.other.Loyalty.CardsJ,y=SatisfactionJ))+geom_point()
 
 #Class
 ggplot(ProjectData,aes(y=Satisfaction, x=Class)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$ClassJ <- jitter(ProjectData$Class)
 ggplot(ProjectData,aes(x=ClassJ,y=SatisfactionJ))+geom_point()
 
 #Scheduled.Departure.Hour
 ggplot(ProjectData,aes(y=Satisfaction, x=Scheduled.Departure.Hour)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$Scheduled.Departure.HourJ <- jitter(ProjectData$Scheduled.Departure.Hour)
 ggplot(ProjectData,aes(x=Scheduled.Departure.HourJ,y=SatisfactionJ))+geom_point()
 
 #Flight.Distance
 ggplot(ProjectData,aes(y=Satisfaction, x=Flight.Distance)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$Flight.DistanceJ <- jitter(ProjectData$Flight.Distance)
 ggplot(ProjectData,aes(x=Flight.DistanceJ,y=SatisfactionJ))+geom_point()
 
 #arrivalDelay
 ggplot(ProjectData,aes(y=Satisfaction, x=arrivalDelay)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$arrivalDelayJ <- jitter(ProjectData$arrivalDelay)
 ggplot(ProjectData,aes(x=arrivalDelayJ,y=SatisfactionJ))+geom_point()
 
 #DepartureDelay
 ggplot(ProjectData,aes(y=Satisfaction, x=DepartureDelay)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$DepartureDelayJ <- jitter(ProjectData$DepartureDelay)
 ggplot(ProjectData,aes(x=DepartureDelayJ,y=SatisfactionJ))+geom_point()
 
 #shop_at_airport
 ggplot(ProjectData,aes(y=Satisfaction, x=shop_at_airport)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$shop_at_airportJ <- jitter(ProjectData$shop_at_airport)
 ggplot(ProjectData,aes(x=shop_at_airportJ,y=SatisfactionJ))+geom_point()
 
 #AirlineStatus
 ggplot(ProjectData,aes(y=Satisfaction, x=AirlineStatus)) +geom_point()
 ProjectData$SatisfactionJ <- jitter(ProjectData$Satisfaction)
 ProjectData$AirlineStatusJ <- jitter(ProjectData$AirlineStatus)
 ggplot(ProjectData,aes(x=AirlineStatusJ,y=SatisfactionJ))+geom_point()
