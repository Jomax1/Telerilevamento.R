# code to build your own function

somma <- function(x,y) {
  z = x + y
  return(z)
  }

differenza <- function(x,y) {
  z = x - y
  return(z)
  }

# multiframe
mf <- function(nrow,ncol) {
  par(mfrow=c(nrow,ncol))
  }

positivo <- function(x) 
  {
  if(x>0)
    {
    print("Questo numero è positivo, non lo sai?")
    }
  else if(x<0)
    {
    print("Questo numero è negativo")
    }
  else 
    {
    print("Lo zéro è zero")
    }
  }

  




