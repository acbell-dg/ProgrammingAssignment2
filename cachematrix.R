## Computing the inverse of a matrix can be time consuming, so this code
## is written to perform the computation as well as 
##cache and retrieve the inverse matrix

## This function makes a special "matrix" that 
##can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set<-function(y) {
    x<<-y
    inv<<-NULL
  }
  get<-function() x
  setinverse <- function(inverse) inv<<-inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function retrieves the cached inverse or, 
##if not found or the matrix has changed, 
##computes the inverse itself

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
}
