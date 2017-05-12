setwd("")

# 1.
# data <- read.table(header = TRUE,"hw3_p1.txt")
# data <- data[,1]
# data <- data-7.39
# wilcox.test(data)
# sort(abs(data))


# 2.
# data <- read.table("hw3_p2.txt",header = TRUE,sep = "\t")
# x <- c(data[,2]-data[,3])
# xmean = mean(x);
# wilcox.test(x)
# sort(abs(x))


#3.
data <- read.table("hw3_p3.txt",header = TRUE, sep='\t')
x <- c(data[,1])
y <- c(data[,2])
xmean = mean(x);
ymean = mean(y);
wilcox.test(x,y,paired = F,alternative = "less")


#4
# data <- read.table("hw3_p4.txt",header = TRUE, sep='\t')
# data <- data[,1]
# r <- matrix(list(),nrow=8,ncol=8)
# for (i in 1:8){
#   for(j in i:8){
#     r[i,j] <- (data[i]+data[j])/2;
#   }
# }
# for (x in r){
#   y <- c(y,x);
# }


# 5.
# data <- read.table("hw3_p5.txt",header = TRUE, sep='\t')
# x <- c(data[,1])
# y <- c(data[,2])
# r <- matrix(list(),nrow=5,ncol=5)
# for( i in 1:5){
#   for(j in 1:5){
#     r[i,j] <- (x[i]-y[j])
#   }
# }
# a <- c()
# for( i in r)
#   a <- c(a,i)
# 
# sort(a)
