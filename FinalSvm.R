library(kernlab)

Create_AirplainSatisfaction <- function(vec){ 
  vBuckets <- replicate(length(vec), "medium")
  vBuckets[vec > 3] <- "high"
  vBuckets[vec <= 2] <- "low"
  return(vBuckets)
}

surveyData<-read.csv("surveyDataV7.csv")
surveyData<- data.frame(surveyData) #read the data
#View(surveyData)
surveySampleIndex <- sample(1:dim(surveyData)[1],size=30000) #created a sample for surveyData of size 30000
#View(surveySampleIndex)
#View(surveyData[surveySampleIndex,])
newsurveyData <- surveyData[surveySampleIndex,]
View(newsurveyData) 
newsurveyData<-newsurveyData[,-1]#removing x
newsurveyData<-newsurveyData[,-8] #removing loayalty cards
#newsurveyData <-newsurveyData[,-9] #removing airline name
newsurveyData <-newsurveyData[,-12] #removing flight distance
str(newsurveyData)
newsurveyData$Satisfaction <- as.factor(Create_AirplainSatisfaction(newsurveyData$Satisfaction))
View(newsurveyData) #modified new survey data for svm
cutPoint <- floor(2*dim(newsurveyData)[1]/3)
randIndex <- sample(1:dim(newsurveyData)[1]) 
summary(randIndex)
train <- newsurveyData[randIndex[1:cutPoint],]
test <- newsurveyData[randIndex[(cutPoint+1):dim(newsurveyData)[1]],]
dim(train)#20000
dim(test) #10000
library(kernlab)

svmOutput <- ksvm(Satisfaction ~Type.of.Travel + Price.Sensitivity + Age + shop_at_airport+ Flight.cancelled + Years.Old
+ Class + arrivalDelay + DepartureDelay + AirlineStatus, data= train, kernel= "rbfdot", kpar = "automatic", C = 10, cross = 10, prob.model = TRUE)
svmOutput
summary(svmOutput)
svmPred <- predict(svmOutput, test)
svmPred <- as.numeric(svmPred)
summary(svmPred)
ctable1<- data.frame(test$Satisfaction,svmPred)
tableC<-table(ctable1)
t1<-tableC[1,1]+tableC[2,2]+tableC[3,3]
t2<-tableC[1,2]+tableC[1,3]+tableC[2,1]+tableC[2,3]+tableC[3,1]+tableC[3,2]
errorRate <- (t2/(t1+t2)) * 100
#ErrorRate is 29.43
accuracy <- (t1/(t1+t2)) * 100
              