#songpon srisawai 5710505064 , t-distribution 
n = 100
df = n-1;
k = 100;

sample_set = matrix(list(),nrow=100,ncol=100);
mean_sample_set = c();
median_sample_set = c();
minmax_sample_set = c();
trim_sample_set = c();
for(i in 1:k){
  x <- c(rt(n,df,0))
  row_mean = mean(x)
  row_median = median(x)
  sample_set[i,] <- (x)
  min_row = min(x)
  max_row = max(x)
  row_minmax = (max_row+min_row)/2.0
  row_trim = mean(x,trim=0.10)
  mean_sample_set <- c(mean_sample_set,row_mean);
  median_sample_set <- c(median_sample_set,row_median);
  minmax_sample_set <- c(minmax_sample_set,row_minmax);
  trim_sample_set <- c(trim_sample_set,row_trim);
}

mean(mean_sample_set);
var(mean_sample_set);
hist(mean_sample_set);

