#Homogeneity test
setwd("")

raw <- readxl::read_excel("lect7_data_hp.xlsx")
raw[,1] <- NULL

#manage raw data for test
data <- cbind(raw[,1],raw[,5])
i <- dim(data)[1];
j <- dim(data)[2]


#find sum in row (i)
sumi <- c()
for(k in 1:i){
  a = 0
  for(x in data[k,1:j]){
    a <- a + x
  }
  sumi <- c(sumi,a)
}
N <- sum(sumi)

#find sum in col (j)
sumj <- c()
for(k in 1:j){
  a = 0
  for(x in data[1:i,k]){
    a <- a + x
  }
  sumj <- c(sumj,a)
}
n <- sum(sumj)


#find Expect number
eij <- matrix(list(),nrow=i,ncol=j)
for(x in 1:i){
  for(y in 1:j){
    eij[x,y] <- (sumi[x]*sumj[y])/N;
  }
}


#find test statistic
test <-matrix(list(),nrow=i,ncol=j)
test_stat <- 0 
for(x in 1:i){
  a <- 0
  for(y in 1:j){
    test[x,y] <-  as.numeric((as.numeric(data[x,y]) - as.numeric(eij[x,y]))^2/as.numeric(eij[x,y]))
    a <- a + as.numeric(test[x,y])
  }
  test_stat <- test_stat + a
}
(i-1)*(j-1)
test_stat 
