## Examples from the lectures

# For Function

x <- c("a", "b", "c", "d")

for(i in 1:4){
print(x[i])
}

# Another Example

y <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(y))) {
    for(j in seq_len(ncol(y))) {
        print(y[i, j])
    }
}

# While Example

count <- 0

while(count < 10){
# while(count >= 0)  # to make an infinite loop  
    print(count)
    count <- count + 1
}

# Another Example of While
z <- 5

while(z >= 3 && z <= 10){
    print(z)
    coin <- rbinom(1, 1, .5)
    if(coin == 1) { #ramdom walk
        z <- z + 1
    } else {
    z <- z - 1
    }
}

# Next Example

x <- 1

for(i in 1:100) {
    if(i >= 20){
        next
    }
    print(x)
    x <- x + i
}

# First Functions Examples

add2 <- function(x, y) {
    x + y
}

above10 <- function(x) {
    use <- x > 10
    x[use]
}

above <- function(x, n =10) {
    use <- x > n
    x[use]
}

columnmean <- function(x, removeNA = TRUE) {
    nc <- ncol(x)
    means <- numeric(nc)
    for(i in 1:nc){
        means[i] <- mean(x[, 1], na.rm = removeNA) # na.rm is a parameter of mean function 
    }
    means
}

# Lexical Scoping: the result is another function. I have to call another name, pass an argument and then pass another one

make.power <- function(n) {
    pow <- function(x){
        x^n
    }
    pow
}

# Another lexical example

y <- 10

f <- function(x){
    y <- 2
    y^2 + g(x)
}

g <- function(x) {
    x * y
}
# when I call f(3) it will use in f function 2 for y, but in g function it will use 10, because they are in different environments

## Beggining of the quizz ##

#1 
cube <- function(x, n) {
    x^3
}

#2
x <- 1:10
if(x > 5){
    x <- 0
}