# Importing the dataset
setwd("C:/Users/jason/Desktop/jason/syracuse/IST687/project")
dataset = read.csv('surveyDataV7_yuyu.csv')
#dataset = dataset[, 2:15]

# Fitting Linear Regression to the dataset
regressor = lm(formula = Satisfaction ~.,
               data = dataset)
summary(regressor)

#delete not signifi. variables
dataset$No..of.other.Loyalty.Cards <- NULL
dataset$Flight.Distance <- NULL


#Splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Satisfaction, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Satisfaction ~.,
               data = training_set)
summary(regressor)

# Feature Scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

y_pred = predict(regressor, newdata = test_set)
y_pred

actuals_preds <- data.frame(cbind(actuals=test_set$Satisfaction, predicteds=y_pred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)
correlation_accuracy
head(actuals_preds)
tail(actuals_preds)
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))
min_max_accuracy

# #install.packages("DAAG")
# #K fold validation
# library(DAAG)
# cvResults <- suppressWarnings(CVlm(df=dataset, form.lm=satisfaction ~., m=5, dots=FALSE, seed=29, legend.pos="topleft",  printit=FALSE, main="Small symbols are predicted values while bigger ones are actuals."));  # performs the CV
# attr(cvResults, 'ms')  # => 251.2783 mean squared error
