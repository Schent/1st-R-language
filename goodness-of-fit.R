setwd("")

raw <- read.table("exmp13-10.txt",header =T)

#find observe 
y <- raw[,1]
x <- c(-Inf,117.9,132.9,144.5,155.4,167.1,182.1,Inf)
n = length(y)
cutResult <- cut(y,x)
freq <- table(cutResult)

#p_var <- sqrt(/n)  #var = 31.42

#find Expected 
s_mean <- mean(y)
s_sd <- sd(y)
ans <- c()
for (i in 1:7){
  a <- n*(pnorm((x[i]-s_mean)/31.42,mean = 0,sd = 1)-pnorm((x[i+1]-s_mean)/31.42,mean = 0, sd = 1))
  ans <- c(ans,abs(a))
}

#test statistic 
t_stat <- 0
for (i in 1:7){
  k <- (as.numeric(freq[i]-ans[i]))^2/ans[i]
  t_stat = t_stat +k
}

