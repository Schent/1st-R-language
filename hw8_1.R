################################
###### Produce VS Revenue ######
################################

#setup environment
setwd("")
write("",file = "report.txt")    # y ~ x
write("",file = "report_multi.txt")  # y ~ x1+x2+x3...


#read data & set NA to zero.
data56 <- read.csv("data_2556.csv")
data58 <- read.csv("data_2558.csv")
data_price <- read.csv("data_prices.csv")
data56[ is.na(data56) ] <- 0
data58[ is.na(data58) ] <- 0
data_price[ is.na(data_price) ] <- 0


#create col produce.revenue = produce*price/population
produce.revenue <- c()
produce.revenue2 <- c()
j <- 2
for(i in 5:9){
  produce.revenue <- cbind(produce.revenue,cbind((data56[,i]/data56$X2556.Population)*data_price[1,j]))
  produce.revenue2 <- cbind(produce.revenue2,cbind((data58[,i]/data58$X2558.Population)*data_price[2,j]))
  j <- j+1
}

year <- c("2556","2558")
word <- c("rice","egg","pork","maize","rubber")
colnames(produce.revenue) <- c(word)
colnames(produce.revenue2) <- c(word)
data56 <- data.frame(data56,cbind(produce.revenue))
data58 <- data.frame(data58,cbind(produce.revenue2))

#delete error 
e56 <- c()
e58 <- c()
for(i in 1:nrow(data56)){
  for(j in 1:5){
    if(data56[i,word[j]] > data56$X2556.Revenue[i]){
      e56 <- c(e56,i)
    }
    if(data58[i,word[j]] > data58$X2558.Revenue[i]){
      e58 <- c(e58,i)
    }
  }
}
for(i in 1:length(e56)){
  data56  <- data56[-i,]
}
for(i in 1:length(e58)){
  data58  <- data58[-i,]
}




#Rejession x = col(rice,egg,pork,maize,rubber) , y = population revenue
y56 <- c(data56$X2556.Revenue)
y58 <- c(data58$X2558.Revenue)
x56 <- cbind(data56$rice,data56$egg,data56$pork,data56$maize,data56$rubber)
x58 <- cbind(data58$rice,data58$egg,data58$pork,data58$maize,data58$rubber)

colnames(x56) <- c(word)
colnames(x58) <- c(word)

#print output

for(j in 1:5){
  model <- lm(y56 ~ x56[,j])
  model2 <- lm(y58 ~ x58[,j])
  out<-c()
  out2<-c()
  out<-capture.output(summary(model))
  out2<-capture.output(summary(model2))
  cat(sprintf("%20s : %s %60s : %s",year[1],word[j],year[2],word[j]),append = T,file = "report.txt")
  cat(sprintf("%s  %70s",out,out2), file = "report.txt",append = T,sep = "\n")
  cat(sprintf("====================================================================================================================================================="),file="report.txt",append = T,sep = "\n")
}

#print ouput multiple linear regression 
model <- lm(y56 ~ x56[,"rice"]+x56[,"egg"]+x56[,"pork"]+x56[,"maize"]+x56[,"rubber"])
model2 <- lm(y58 ~ x58[,"rice"]+x58[,"egg"]+x58[,"pork"]+x58[,"maize"]+x58[,"rubber"])
out<-c()
out2<-c()
out<-capture.output(summary(model))
out2<-capture.output(summary(model2))
cat(sprintf("%20s : %s %50s : %s",year[1],"multiple linear regression",year[2],"multiple linear regression\n"),append = T,file = "report_multi.txt")
cat(sprintf("%s  %70s",out,out2), file = "report_multi.txt",append = T,sep = "\n")
cat(sprintf("====================================================================================================================================================="),file="report_multi.txt",append = T,sep = "\n")


#plot 
plot(x56[,"rice"],y56)
model <- lm(y56 ~ x56[,"rice"])
abline(model, col='blue')

