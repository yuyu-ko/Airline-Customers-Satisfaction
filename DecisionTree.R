setwd("C:/Users/jason/Desktop/jason/syracuse/IST687/project")
AirplainSatisfaction = read.csv('surveyDataV7_yuyu1.csv')

regressor = lm(formula = Satisfaction ~.,
               data = AirplainSatisfaction)
summary(regressor)

AirplainSatisfaction$No..of.other.Loyalty.Cards <- NULL
AirplainSatisfaction$Flight.Distance <- NULL
AirplainSatisfaction$Airline.Name <- NULL
AirplainSatisfaction$weekday <- NULL
AirplainSatisfaction$X <- NULL
#Decision Tree

#AirplainSatisfaction = read.csv('surveyDataV7_yuyu.csv')
Create_AirplainSatisfaction <- function(vec){ 
  vBuckets <- replicate(length(vec), "high")
  vBuckets[vec <= 3 & vec > 2] <- "medium"
  vBuckets[vec <= 2] <- "low"
  return(vBuckets)
}
AirplainSatisfaction$Evaluation <- Create_AirplainSatisfaction(AirplainSatisfaction$Satisfaction)
AirplainSatisfaction$Satisfaction <- NULL
str(AirplainSatisfaction)

library(rpart)
library(rpart.plot)
fit <- rpart(Evaluation~., data = AirplainSatisfaction, method = 'class',cp=0.005)
rpart.plot(fit)

a <- nrow(AirplainSatisfaction)
a1 <- a/3
df1 <- AirplainSatisfaction[1:a1,]
a2 <- a/3 * 2
df2 <- AirplainSatisfaction[a1:a2,]
a3 <- a/3 * 3
df3 <- AirplainSatisfaction[a2:a3,]

#df1
fit <- rpart(Evaluation~., data = df1, method = 'class',cp=0.005)
rpart.plot(fit)

#df2
fit <- rpart(Evaluation~., data = df2, method = 'class',cp=0.005)
rpart.plot(fit)

#df3
fit <- rpart(Evaluation~., data = df3, method = 'class',cp=0.005)
rpart.plot(fit)
