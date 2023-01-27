## make a cache matrix using optional arguments data, nrow, ncol


makeCacheMatrix <- function(x = matrix()) {
  set <- function(y) {
    x <<- y
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix()
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## invert matrix cached in makeCacheMatrix


cacheSolve <- function(x, ...) {
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
  ## Return a matrix that is the inverse of 'x'
}
