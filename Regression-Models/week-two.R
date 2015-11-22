## week 2

## quizz

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
summary(lm(y ~ x))

data(mtcars)
fit <- lm(mtcars$mpg ~ mtcars$wt)
sumCoef <- summary(fit)$coefficients
sumCoef[1,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[1, 2]
(sumCoef[2,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[2, 2]) * 2 # changing the unit of wt, before we were talking about 1000/lbs and now 2000
sumCoef[2,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[2, 2]

mtcars <- data.frame(wt=c(3, 2.4, 3.6))
p2 <- predict(fit, newdata = mtcars, interval = ("prediction"))

data(mtcars)
fit <- lm(mtcars$mpg ~ mtcars$wt)
mtcars$wt <- mtcars$wt +2
fit2 <- lm(mtcars$mpg ~ (mtcars$wt) )

data(mtcars)
fit <- lm(mtcars$mpg ~ mtcars$wt)
fit2 <- lm(mtcars$mpg ~ mtcars$wt -1)