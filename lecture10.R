
wd <- getwd();
mydata <- read.table("exmp12-05.txt",header = T)
attach(mydata)

x <- filtrate
y <- moistcon

model <- lm(y ~ x)
summary(model)

plot(x,y)
abline(model, col='blue')

res <- residuals(model);

