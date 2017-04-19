setwd("/Users/schent/Documents/year3/stat_com/lect11_data/")

mydata <- read.table("exmp12-36.txt",header = T)

attach(mydata)

model <- lm(wingspan ~ height+foot)
summary(model)

#abline(model, col='blue')

res <- residuals(model)
