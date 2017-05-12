
setwd("")
mydata <- read.table("exmp12-32.txt", header = T)
x <- cbind(c(rep(1,6)), mydata[,3], mydata[,5])
y <- matrix(mydata[,2],6)

# beta = (x'x)^-1X'y, transpose t(x), inverse: solve(x), multiple %*% 

beta <- solve(t(x)%*%x) %*%(t(x) %*%y)

attach(mydata)
model <- lm(hp ~ liters + premium1)
summary(model)
