## Week 4 Video Lectures

## set seed: so you can go back to the random numbers you've reached before

set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

## generating random numbers for a linear model

set.seed(20)
# x <- rnorm(100)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
plot(x, y)

## sample random numbers

set.seed(1)
sample(1:10, 4)

sample(1:10) #permutation

sample(1:10, 4, replace = TRUE) #permits replacements