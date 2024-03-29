complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  files <- list.files(directory, full.names=TRUE)
  nobs <- id
  for(i in files){
    info <- read.csv(i)
    for(j in id){
      if(info[1,4] == j){
        com <- complete.cases(info[,c(2,3)])
        nobs[nobs == j] <- nrow(info[com,])
      }
    }
  }
  data.frame(id,nobs)

}
