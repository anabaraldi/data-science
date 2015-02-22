## Cache Matrix Function

## Sometimes we work with some big data and we deal with a new kind of problem: time-consuming
## computations, but there is a way to work with it. We don't need to do all the calculations 
## if they are the same, it is possible to cache the results, and check if we have done it before.
## Our code will do this process to inverting matrices. 

## The first formula "makeCacheMatrix" set all the formulas we need to do the calculus in a list,
## it will set and get the matrix we're working with and then it will set and get the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
    setinverse = setinverse,
    getinverse = getinverse)
}

## Our next formula "cacheSolve" will really do the calculation with the data that we've stablished
## in the previous function. However, it will check if we haven't done the calculus before. If 
## we have already got the inverse matrix, it will take it from the cache and send us the following
## message: "getting cache data". If it haven't done the calculus, the function will calculate the
## inverse matrix and then cache it, in the case we need the results in the future.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

