## Week three

## Quizz
#1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(dplyr)

training <- segmentationOriginal %>% filter(Case == "Train")
testing <- segmentationOriginal %>% filter(Case == "Test")

set.seed(125)
fit <- train(Class ~ ., method="rpart", data=training)
new_data <- data.frame(TotalIntenCh2 = 23000,
                       FiberWidthCh1 = 10,
                       VarIntenCh4 = 100)
predict(fit, newdata=new_data)

library(pgmm)
data(olive)
olive <- olive[,-1]

inTrain <- createDataPartition(y = olive$Area, list = FALSE)

training <- olive[inTrain,]
testing <- olive[-inTrain,]

fit <- train(Area ~ ., method="rpart", data=training)
predict(fit, newdata = as.data.frame(t(colMeans(olive))))

library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

fit <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, method="glm", family="binomial", data=trainSA)
missClass <- function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

train_pred <- predict(fit, trainSA)
test_pred <- predict(fit, testSA)

miss_class_train <- missClass(trainSA$chd, train_pred)
miss_class_test <- missClass(testSA$chd, test_pred)

library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

vowel.train <- vowel.train %>% mutate(y = factor(y))
vowel.test <- vowel.test %>% mutate(y = factor(y))

set.seed(33833)

fit <- train(y ~ ., method = "rf", data=vowel.train)
varImp(fit)




