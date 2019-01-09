# Importing the dataset
setwd("C:/Users/jason/Desktop/jason/syracuse/IST687/project")
dataset = read.csv('surveyDataV7_yuyu.csv')
#dataset = dataset[, 2:15]
#Age Adjusted R-squared:  0.04921 
regressor = lm(formula = Satisfaction ~ Age,
               data = dataset)
summary(regressor)
#Age+Gender Adjusted R-squared:  0.06447 
regressor = lm(formula = Satisfaction ~ Age + Gender_cat,
               data = dataset)
summary(regressor)
#Age+Gender + Price.Sensitivity Adjusted R-squared:  0.07449 
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old Adjusted R-squared:  0.07482 
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old + No.of.Flights.p.a. Adjusted R-squared:  0.1139
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old+No.of.Flights.p.a.,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old + No.of.Flights.p.a.+Type_travel_cat  Adjusted R-squared:  0.337
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old+No.of.Flights.p.a.
               + Type_travel_cat,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old + No.of.Flights.p.a.+Type_travel_cat+Class  Adjusted R-squared:  0.3373
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old+No.of.Flights.p.a.
               + Type_travel_cat + Class,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old + No.of.Flights.p.a.+Type_travel_cat+Class + Scheduled.Departure.Hour  Adjusted R-squared:  0.3373
#Scheduled.Departure.Hour not significant.
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old+No.of.Flights.p.a.
               + Type_travel_cat + Class + Scheduled.Departure.Hour,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old + No.of.Flights.p.a.+Type_travel_cat+Class + Scheduled.Departure.Hour + arrivalDelay  Adjusted R-squared:  0.3549
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old+No.of.Flights.p.a.
               + Type_travel_cat + Class + arrivalDelay,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old + No.of.Flights.p.a.+Type_travel_cat+Class + arrivalDelay +DepartureDelay Adjusted R-squared:  0.3555
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old+No.of.Flights.p.a.
               + Type_travel_cat + Class + arrivalDelay + DepartureDelay,
               data = dataset)
summary(regressor)

#Age+Gender + Price.Sensitivity + Years.old + No.of.Flights.p.a.+Type_travel_cat+Class + arrivalDelay +DepartureDelay +shop_at_airport Adjusted R-squared:  0.3559
regressor = lm(formula = Satisfaction ~ Age + Gender_cat +Price.Sensitivity+Years.Old+No.of.Flights.p.a.
               + Type_travel_cat + Class + arrivalDelay + DepartureDelay + shop_at_airport,
               data = dataset)
summary(regressor)

plot(regressor)
regressor$residuals

#install.packages("olsrr")
library(jtools)
library(olsrr)
model <- Satisfaction~.
fit <- lm(model, dataset)
test <- ols_all_subset(fit)
plot(test)

