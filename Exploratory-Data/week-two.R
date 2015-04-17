# Video Lectures

# Simple Lattice Plot
library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality) # default is a little dif from the base plot system

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1)) # it will plot Ozone and Wind by (|) Month

# panel functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1)) # Plot with two panels
xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...) # first call the default panel function
    panel.abline(h = median(y), lty = 2) #add a horizontal line at the median
})

# ggplot

# hello world hehe
library(ggplot2)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv) #highlight some groups, automatically creates legend
qplot(displ, hwy, data = mpg, geom = c("point", "smooth")) #add some statistics 
qplot(displ, hwy, data = mpg, facets = .~drv) #facets are like panels in lattice

# Quizz 2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)


