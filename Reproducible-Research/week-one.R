## Data Analysis Structure

library(kernlab)
data(spam)

# Subsampling
set.seed(3435)
trainIndicator <- rbinom(4601, size = 1, prob = 0.5)

trainSpam <- spam[trainIndicator == 1, ]
testSpam <- spam[trainIndicator == 0, ]
