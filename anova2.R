#lec6 ANOVA 2 factor

setwd("/")

data <- read.table(header = TRUE,"exmp11-16.txt")
i=3;j=4;k=3
yield <- c()
for (x in data[,1])
  yield <- c(yield,x)

#SST, df= ijk-1
sst = 0;
for(x in yield){
  sst =  sst+ ((x-mean(yield))^2)
}
sst_df = (i*j*k)-1

#SSA, df = i-1
ssa = 0;
ssa_df = i-1;
mean_i <- c();
a <- c();
for( x in yield){
  a <- c(a,x)
}
