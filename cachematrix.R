## this pair of functions cache and calculate the inverse of a matrix if not in cache.

## The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
	set the value of the matrix
    get the value of the matrix
    set the value of the inverse (using solve function)
    get the value of the inverse 


makeCacheMatrix <- function(x = matrix()) {
  im <- NULL
  set <- function(y) {
    x <<- y
    im <<- NULL
  }
  get <- function() x
  setinv <- function(solve) im <<- solve
  getinv <- function() im
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## this function get from cache the inverse of the matrix if it was the last calculated, else calculate the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  im <- x$getinv()
  if(!is.null(im)) {
    message("getting cached data")
    return(im)
  }
  data <- x$get()
  data
  im <- solve(data)
  x$setinv(im)
  im
}
