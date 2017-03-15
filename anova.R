#ANOVA test
setwd("")

data <- read.table("5710505064_hw4.txt", header=T)
attach(data)

x <- data.frame(people=data[,1],
                sex=factor(rep(c("M","F"),times=c(2,2))),
                location=factor(rep(c("BKK","center","north","north-east","south"),times=c(4,4,4,4,4)))
                )
a <- aov(people ~ sex*location, data=x)
summary(a)
interaction.plot(location,sex,Response=people)
