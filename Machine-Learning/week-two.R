## Example
# Data Splitting
library(caret)
library(kernlab)

data(spam)

inTrain <- createDataPartition(y = spam$type, p = 0.75, list = FALSE)

training <- spam[inTrain,]
testing <- spam[-inTrain,]

## We can do cross validation as well, with K-fold
folds <- createFolds(y = spam$type, k = 10, list = TRUE, returnTrain = TRUE)

## We can do the same with resample
folds <- createResample(y = spam$type, times = 10, list = TRUE)

## Times slices to do forecast
tme <- 1:1000
folds <- createTimeSlices(y = tme, initialWindow = 20, horizon = 10) # horizon is how many elements i'm trying to predict


## Quizz 2
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
library(Hmisc)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

cut_mixtures <- cut2(training$CompressiveStrength, g=3)

ggplot(training, aes(CompressiveStrength, Age, colour = cut_mixtures)) + geom_point()
ggplot(training, aes(CompressiveStrength, FlyAsh, colour = cut_mixtures)) + geom_point()
ggplot(training, aes(CompressiveStrength, Cement, colour = cut_mixtures)) + geom_point()
featurePlot(training[-9], training[9], "pairs")

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433) 
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

selected_cols <- dplyr::select(training, diagnosis, matches("\\IL."), -TRAIL_R3)
preProc <- preProcess(selected_cols[-1], method="pca", thresh = 0.8)
trainPC <- predict(preProc, selected_cols[-1])

modelFitPC <- train(training$diagnosis ~ ., method="glm", data = trainPC)
modelFit <- train(training$diagnosis ~ ., method="glm", data = selected_cols)

modelFit
modelFitPC