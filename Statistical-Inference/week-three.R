# Video Lectures

data(sleep)

g1 <- sleep$extra[1 : 10]
g2 <- sleep$extra[11 : 20]

difference <- g2 - g1

mn <- mean(difference) 
s <- sd(difference)
n <- 10

mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n) # t interval calculated by hand
t.test(difference)$conf.int
t.test(g2, g1, paired=TRUE)

# t test
library(UsingR)
data(father.son)
t.test(father.son$sheight - father.son$fheight) #is the son's height equivalent to father's height, so is the difference equal to 0
t.test(father.son$sheight, father.son$fheight, paired=TRUE) # that is the same!!!!

# quizz

#1
mn <- 1100
s <- 30
n <- 9
mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)

# 3
difference <- 3 -5
n <- 10
var_new <- 0.6
var_old <- 0.68
pooled_var <- ((n-1) * var_new + (n-1) * var_old) / (2 * n - 2)
s <- sqrt(pooled_var)

difference + c(-1, 1) * qt(.975, n + n -2) * s * sqrt(1/n + 1/n)

# 6
n <- 100
difference <- 6 - 4
var_new <- 0.5
var_old <- 2
pooled_var <- ((n-1) * var_new + (n-1) * var_old) / (2 * n - 2)
s <- sqrt(pooled_var)

difference + c(-1, 1) * qnorm(.95) * s * sqrt(1/n + 1/n)

#7
n <- 9
treated_dif <- -3
placebo_dif <- 1
treated_sd <- 1.5
placebo_sd <- 1.8

pooled_var <- ((n-1) * treated_sd ^ 2 + (n-1) * placebo_sd ^ 2) / (2 * n - 2)
s <- sqrt(pooled_var)

treated_dif - placebo_dif + c(-1, 1) * qt(.95, n + n -2) * s * sqrt(1/n + 1/n)
