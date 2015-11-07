# Quizz

#1
x <- c(140, 138, 150, 148, 135)
y <- c(132, 135, 151, 146, 130)
t.test(x, y, paired=TRUE, alternative="two.sided")

#2
mn <- 1100
s <- 30
n <- 9
mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)

#3
pbinom(3, 5, .5) - pbinom(2,5,.5)

#4
ppois(10, 1787*1/100)

#5
n <- 9
treated_dif <- -3
placebo_dif <- 1
treated_sd <- 1.5
placebo_sd <- 1.8

pooled_var <- ((n-1) * treated_sd ^ 2 + (n-1) * placebo_sd ^ 2) / (2 * n - 2)
s <- sqrt(pooled_var)
z <- (-3+1) / s

pnorm(z) * 2

#7
power.t.test(n=100, delta=0.01-0, sd=0.04, type="one.sample", alt="one.side")

#8
power.t.test(power=0.9, delta=0.01-0, sd=0.04, type="one.sample", alt="one.side")