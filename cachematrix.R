## Pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## creating a first special matrix

makeCacheMatrix <- function(x = matrix()) {
        
        i <- NULL
        set <- function(y) {
                
                x <<- y
                i <<- NULL
                
        }


## this below function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then it should retrieve the inverse from the cache.

        get <- function() x
        setInverse <- function(inverse) i <<- inverse
        getInverse <- function() i
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
        
}
