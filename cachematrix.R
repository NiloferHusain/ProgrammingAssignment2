## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse


makeCacheMatrix <- function(x=matrix()) {
        I <- NULL

        get <- function() {
          x      
        }
        
        set<-function(y=matrix()){
                x<<-y
                I <<- NULL    
        }
        
        setinverse <- function(b=matrix()) {
                I <<- b
        }
        getinverse <- function() {
                I
        }
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.


cacheSolve <- function(R,...) {
        W <- R$getinverse()
        if(!is.null(W)) {
                message("getting cached data")
                return(W)
        }
        W <- solve(R$get())
        R$setinverse(W)
        W
}
