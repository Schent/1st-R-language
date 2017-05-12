setwd("")

mydata <- read.table("exmp12-07.txt",header = T)
attach(mydata)

x <- filtrate
y <- moistcon

model <- lm(y ~ x)
summary(model)

plot(x,y)
abline(model, col='blue')

res <- residuals(model);

