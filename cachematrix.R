makeCacheMatrix <- function(x = numeric()) {
        cache <- NULL
        setMatrix <- function(newValue) {
                x <<- newValue
                # since the matrix is assigned a new value, flush the cache
                cache <<- NULL
        }
        
        # returns the stored matrix
        getMatrix <- function() {
                x
        }
        
        # cache the given argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        
        # get the cached value
        getInverse <- function() {
                cache
        }
        
        # return a list. Each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


# The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix
cacheSolve <- function(y, ...) {
    
        inverse <- y$getInverse()
      
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        # caclulate the inverse and store it in
        # the cache
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        # return the inverse
        inverse
}