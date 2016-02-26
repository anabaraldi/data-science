# Week four

# Quiz
#Q1
library(ElemStatLearn)
library(caret)
library(dplyr)
data(vowel.train)
data(vowel.test)

vowel.train <- vowel.train %>% mutate(y = factor(y))
vowel.test <- vowel.test %>% mutate(y = factor(y))

set.seed(33833)

fit_rf <- train(y ~ ., method = "rf", data=vowel.train)
fit_gbm <- train(y ~ ., method = "gbm", data=vowel.train, verbose=F)

pred_rf <- predict(fit_rf, vowel.test)
cat("accuracy rf:", mean(pred_rf == vowel.test$y), "\n")
pred_gbm <- predict(fit_gbm, vowel.test)
cat("accuracy gbm:", mean(pred_gbm == vowel.test$y), "\n")

predDF <- data.frame(pred_rf, pred_gbm, y = vowel.test$y)
# Accuracy among the test set samples where the two methods agree
sum(pred_rf[predDF$pred_rf == predDF$pred_gbm] == 
        predDF$y[predDF$pred_rf == predDF$pred_gbm]) / 
    sum(predDF$pred_rf == predDF$pred_gbm)

# pred_df <- data.frame(pred_rf, pred_gbm, y = vowel.test$y)
# fit_total <- train(y ~ ., method="gam", data=pred_df)
# pred_total <- predict(fit_total, pred_df)

#Q2
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData <- data.frame(diagnosis,predictors)
inTrain <- createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training <- adData[ inTrain,]
testing <- adData[-inTrain,]

set.seed(62433)
fit_rf <- train(diagnosis ~ ., method = "rf", data = training)
fit_gbm <- train(diagnosis ~ ., method = "gbm", data = training, verbose=FALSE)
fit_lda <- train(diagnosis ~ ., method = "lda", data = training)

pred_rf <- predict(fit_rf,testing)
cat("accuracy rf:", mean(pred_rf == testing$diagnosis), "\n")
pred_gbm <- predict(fit_gbm, testing)
cat("accuracy gbm:", mean(pred_gbm == testing$diagnosis), "\n")
pred_lda <- predict(fit_lda, testing)
cat("accuracy lda:", mean(pred_lda == testing$diagnosis), "\n")

# Fit a model that combines all (both of the predictors)
pred_df <- data.frame(pred_rf, pred_gbm, pred_lda, diagnosis=testing$diagnosis)
#train a new model on the predictions
combModFit <- train(diagnosis ~.,method="rf",data=pred_df)
predComb <- predict(combModFit,testing)
cat("accuracy comb:", mean(predComb == testing$diagnosis), "\n")


#Q3
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)

inTrain <- createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training <- concrete[ inTrain,]
testing <- concrete[-inTrain,]

set.seed(233)
fit <- train(CompressiveStrength ~ ., method="lasso", data=training)
pred <- predict(fit, testing)

elast_net <- enet(as.matrix(training[-9]), as.matrix(training$CompressiveStrength), trace=TRUE)
plot(elast_net)

#Q4
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv", "workspace/data-science/Machine-Learning/blog_visitors.csv")
dat <- read.csv("workspace/data-science/Machine-Learning/blog_visitors.csv")

training <- dat[year(dat$date) < 2012,]

testing <- dat[(year(dat$date)) > 2011,]

tstrain <- ts(training$visitsTumblr)

tstest <- ts(testing$visitsTumblr)

fit <- bats(tstrain)
fcast <- forecast(fit, level=95, h=nrow(testing))
sum(fcast$lower < testing$visitsTumblr & testing$visitsTumblr < fcast$upper) / 
    dim(testing)[1]


