## lecture examples

## lapply function: needs a list and a function, then it will do the fun to all the elements in the list

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

y <- 2:5 #even the first number is 2 the first element of the list will be 1
lapply(y, runif)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[ ,1]) #the elt function takes the first col of all the objects in the list, but the function only exist inside lapply

## sapply: it simplifies the result of lapply
x <- list(a = 1:5, b = rnorm(10))
sapply(x, mean)

##apply: it is used for arrays, usually matrices
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) #margin = 2 means i will take the col, if you want the rows use 1

##mapply: do a function to more than one list

mapply(rep, 1:4, 4:1) #it will create a list of four objects, the first one will have the number one four times, and will be decreasing until we get the number 4 one time

##tapply: take the mean of the group
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10) #creates the groups, 3 levels with 10 numbers in each one
tapply(x, f, mean)

#split: separate a list, vector, df in smaller groups by a factor
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10) #creates the groups, 3 levels with 10 numbers in each one
split(x, f)

#example with data frame. Calculate the mean of some variables for each month.
library(datasets)
s <- split(airquality, airquality$Month) #airquality$Month is not a factor but can be converted in one because only takes the numbers 5, 6, 7, 8, 9
sapply(s, function(x) colMeans(x[c("Ozone", "Solar.R", "Wind")]))

## Quizz

# Question 1: mean of Sepal.Length for Virginica species

library(datasets)
data(iris)
s <- split(iris, iris$Species)
sapply(s, function(x) colMeans(x[c("Sepal.Length")]))

# Question 3: mean of mpg by cyl

library(datasets)
data(mtcars)
s <- split(mtcars, mtcars$cyl)
sapply(s, function(x) colMeans(x[c("mpg")]))

#or

sapply(split(mtcars$mpg, mtcars$cyl), mean)

#Question 4: the difference between the average hp with 4 cyl and 8 cyl

subSet <- lapply(split(mtcars$hp, mtcars$cyl), mean)
abs(as.numeric(subSet["4"]) - as.numeric(subSet["8"]))

#Question 5: debug(ls)