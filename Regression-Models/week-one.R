## Week 1
library(UsingR)
library(reshape2)
library(ggplot2)
library(manipulate)

data(galton)
long <- melt(galton)

ggplot(long, aes(value, fill = variable)) + 
    geom_histogram(colour = "black", binwidth=1) + 
    facet_grid(. ~ variable)

## Using manipulate to see which value of mu minimizes the sum of squared deviations
myHist <- function(mu) {
    mse <- mean((galton$child - mu) ^ 2)
    g <- ggplot(galton, aes(x=child)) + 
        geom_histogram(fill = "salmon", colour = "black", binwidth=1) + 
        geom_vline(xintercept = mu, size = 3) +
        ggtitle(paste("mu ", mu, ", MSE = ", round(mse, 2), sep = ""))
    g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))

## create a scatterplot to use both data
ggplot(galton, aes(x=parent, y=child)) + geom_point()

## Using manipulate to see the regression line in the scatterplot
y <- galton$child - mean(galton$child)
x <- galton$parent - mean(galton$parent)
freqData <- as.data.frame(table(x, y))
names(freqData) <- c("child", "parent", "freq")
freqData$child <- as.numeric(as.character(freqData$child))
freqData$parent <- as.numeric(as.character(freqData$parent))
myPlot <- function(beta){
    g <- ggplot(filter(freqData, freq > 0), aes(x = parent, y = child))
    g <- g  + scale_size(range = c(2, 20), guide = "none" )
    g <- g + geom_point(colour="grey50", aes(size = freq+20, show_guide = FALSE))
    g <- g + geom_point(aes(colour=freq, size = freq))
    g <- g + scale_colour_gradient(low = "lightblue", high="white")                     
    g <- g + geom_abline(intercept = 0, slope = beta, size = 3)
    mse <- mean( (y - beta * x) ^2 )
    g <- g + ggtitle(paste("beta = ", beta, "mse = ", round(mse, 3)))
    g
}
manipulate(myPlot(beta), beta = slider(0.6, 1.2, step = 0.02))

## after using manipulate to try finding the slope, lets see how its done in R

lm(I(child - mean(child))~ I(parent - mean(parent)) - 1, data = galton)

## quizz

#1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

#2 #7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(y ~ x -1)
lm(y ~ x)

#3
data(mtcars)
lm(mtcars$mpg ~ mtcars$wt)

#6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
mean <- mean(x)
sd <- sd(x)
xn <- (x - mean) / sd

#9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)


