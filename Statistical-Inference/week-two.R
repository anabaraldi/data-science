# Video Lectures

library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)

round(c(var(x), var(x)/n, sd(x), sd(x)/sqrt(n)), 2)

# var(x) and sd(x) is talking about variability of son's heigth 
# var(x)/n and sd(x)/sqrt(n) (standard error) isn't talking about variability anymore, is talking about variability
# in averages of ten children's heigths

# example from binomial distribution

choose(8, 7) * .5 ^ 8 + choose(8, 8) * .5 ^ 8
pbinom(6, size = 8, prob = .5, lower.tail = FALSE) # it uses 6 because the count starts in 0

# calculating quantiles in normal distribution
qnorm(.95, mean=mu, sd=sd)

# example confidence interval
# 100 likely voters, 56 says they are going to vote for you
# binomial distribution: confidence interval <- p +- 1/sqrt(n)
# that gives us 0.56 +- 1/sqrt(100)
0.56 + c(-1,1) * qnorm(0.975) * sqrt(0.56 * 0.44 / 100)
binom.test(56, 100)$conf.int

# quizz

# question 2
pnorm(70, mean=80, sd=10, lower.tail=TRUE) #lower.tail=T because is less than 70

# question 3
qnorm(0.95, mean=1100, sd=75, lower.tail=TRUE)

# question 4
qnorm(0.95, mean=1100, sd=75/sqrt(100), lower.tail=TRUE)

# question 5
pbinom(3, size = 5, prob = .5, lower.tail = FALSE)

# question 8
ppois(10, lambda=5 * 3)
