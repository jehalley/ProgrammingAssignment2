## There are two functions in this file that work together
## to store calculate the inverse of a matrix, cache it
## for later retrieval and retrieve the inverse from the cache.

## makeCacheMatrix() creates an R object that stores a 
## matrix and its inverse in the function's environment

makeCacheMatrix <- function(x = matrix()) {
  inv<- NULL
  set<- function (y){
    x<<- y
    inv <<- NULL
  }
  get<-function() x
  setinverse<-function(solve) inv<<- solve
  getinverse<-function() inv
  list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)

}


## cacheSolve cacheSolve retrieves the cached inverse
## that is stored in makeCacheinverse's environment

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv

        ## Return a matrix that is the inverse of 'x'
}
