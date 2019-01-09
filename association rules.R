survey <- read.csv("Satisfactionv9.csv")
#View(survey)
library(arules)
Create_AirplainSatisfaction <- function(vec){ 
  vBuckets <- replicate(length(vec), "high")
  vBuckets[vec <= 3 & vec > 2] <- "medium"
  vBuckets[vec <= 2] <- "low"
  return(vBuckets)
}
age <- function(vec){ 
  vBuckets <- replicate(length(vec), "Adolescence")
  vBuckets[vec <= 35 & vec > 20] <- "Young Adult"
  vBuckets[vec <= 55 & vec > 35] <- "Senior Adult"
  vBuckets[vec > 55] <- "old"
  return(vBuckets)
}

fpa <- function(vec){ 
  vBuckets <- replicate(length(vec), "less than 5")
  vBuckets[vec <= 30 & vec > 10] <- "5 to 25"
  vBuckets[vec > 55] <- "more than 25"
  return(vBuckets)
}

yrol <- function(vec){ 
  vBuckets <- replicate(length(vec), "new")
  vBuckets[vec > 3] <- "old"
  return(vBuckets)
}

survey$Satisfaction <- as.factor(Create_AirplainSatisfaction(survey$Satisfaction))
survey$Age <- as.factor(age(survey$Age))
survey$No.of.Flights.p.a. <- as.factor(fpa(survey$No.of.Flights.p.a.))
survey$Years.Old <- as.factor(yrol(survey$Years.Old))
survey$Price.Sensitivity <- as.factor(Create_AirplainSatisfaction(survey$Price.Sensitivity))
View(survey)
str(survey)
survey <- survey[,-11]
View(survey)
#rules for high
ruleset <- apriori(survey,parameter = list(support=0.01, confidence = 0.5),
                   appearance = list(default="lhs",rhs=("Satisfaction=low")))
#inspect(ruleset)
library(arulesViz)
goodrules <- ruleset[quality(ruleset)$lift > 4.6]
#View(goodrules)
inspect(goodrules)

